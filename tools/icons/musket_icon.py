"""Zeichnet das Musketen-Symbol, das im Spiel das Bogen-Symbol der Fernkämpfer ersetzt.

Aufruf: python3 tools/icons/musket_icon.py Module/BalkanMod/GUI/SpriteParts/ui_balkan/General/TroopTypeIcons
Die Namen und Größen entsprechen den Sprites des Spiels (Native/GUI/NativeSpriteData.xml).
"""
import sys, math
from PIL import Image, ImageDraw
def musket(size):
    S=size*8
    im=Image.new("RGBA",(S,S),(0,0,0,0)); d=ImageDraw.Draw(im)
    W=(255,255,255,255)
    def P(x,y): return (x*S, y*S)
    # Gewehr diagonal von unten links (Kolben) nach oben rechts (Mündung), in Einheitskoordinaten
    a=math.radians(-40)
    def R(x,y):
        cx,cy=0.5,0.5; x-=cx; y-=cy
        return P(cx + x*math.cos(a) - y*math.sin(a), cy + x*math.sin(a) + y*math.cos(a))
    # Lauf
    d.polygon([R(0.30,0.47),R(1.02,0.47),R(1.02,0.515),R(0.30,0.515)],fill=W)
    # Schaft unter dem Lauf
    d.polygon([R(0.05,0.50),R(0.78,0.50),R(0.78,0.555),R(0.30,0.56),R(0.12,0.66),R(-0.02,0.66),R(0.0,0.55)],fill=W)
    # Schloss und Abzugsbügel
    d.polygon([R(0.30,0.44),R(0.38,0.44),R(0.38,0.50),R(0.30,0.50)],fill=W)
    d.polygon([R(0.33,0.555),R(0.37,0.555),R(0.355,0.61)],fill=W)
    return im.resize((size,size),Image.LANCZOS)
out=sys.argv[1]
for name,size in [("icon_troop_type_bow",25),("icon_troop_type_bow_big",71)]:
    musket(size).save(f"{out}/{name}.png")
