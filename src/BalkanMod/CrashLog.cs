using System;
using System.Diagnostics;
using System.IO;
using System.Reflection;

namespace BalkanMod
{
    /// <summary>
    /// Schreibt bei einem Absturz die Ausnahme mit allen inneren Ausnahmen in eine Textdatei im Log-Ordner des Spiels
    /// (C:\ProgramData\Mount and Blade II Bannerlord\logs\balkan_absturz.txt). Der Absturzbericht des Spiels enthält
    /// nur ein Speicherabbild, aus dem man die Ursache nicht lesen kann.
    /// </summary>
    public static class CrashLog
    {
        private const int MaxFirstChance = 20;

        private static readonly object Lock = new object();
        private static bool _installed;
        private static int _firstChanceCount;
        [ThreadStatic] private static bool _busy;

        public static void Install()
        {
            if (_installed)
            {
                return;
            }

            _installed = true;
            AppDomain.CurrentDomain.UnhandledException += (_, e) => Write("Unbehandelte Ausnahme", e.ExceptionObject, null);
            // Viele Abstürze kommen als TargetInvocationException (Aufruf über Reflection). Sie wird schon beim
            // Werfen festgehalten, falls das Spiel endet, bevor die Meldung oben ankommt.
            AppDomain.CurrentDomain.FirstChanceException += (_, e) =>
            {
                if (_busy || !(e.Exception is TargetInvocationException) || _firstChanceCount >= MaxFirstChance)
                {
                    return;
                }

                _busy = true;
                try
                {
                    _firstChanceCount++;
                    Write("TargetInvocationException", e.Exception, new StackTrace(1, false).ToString());
                }
                finally
                {
                    _busy = false;
                }
            };
        }

        private static void Write(string kind, object exception, string stack)
        {
            try
            {
                var dir = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData),
                    "Mount and Blade II Bannerlord", "logs");
                Directory.CreateDirectory(dir);
                var text = $"==== {DateTime.Now:yyyy-MM-dd HH:mm:ss} {kind} ===={Environment.NewLine}{exception}{Environment.NewLine}";
                if (stack != null)
                {
                    text += $"---- Aufrufer ----{Environment.NewLine}{stack}{Environment.NewLine}";
                }

                lock (Lock)
                {
                    File.AppendAllText(Path.Combine(dir, "balkan_absturz.txt"), text);
                }
            }
            catch
            {
                // Das Protokoll darf selbst keinen Absturz auslösen.
            }
        }
    }
}
