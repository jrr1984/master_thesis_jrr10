import os
import subprocess
from tempfile import gettempdir
from PIL import Image

figdir = os.path.join("text","figs")
def svg2pdf(svg,pdf):
	if not svg.endswith(".svg"): svg += ".svg"
	if not pdf.endswith(".pdf"): pdf += ".pdf"
	subprocess.Popen("inkscape {} --export-pdf={}".format(svg,pdf).split()).wait()

# png raster image
data = """
	000100011000
	011110110111
	001110110100
	011110110110
	011100011001"""
data = [int(v) for v in "".join(data.split())]
img = Image.new("1",(12,5))
img.putdata(data)
img.save(os.path.join(figdir,"fig1.png"),"PNG")

tmp = os.path.join(gettempdir(),"createfigs.svg")
with open(tmp,"w") as f:
	f.write('<?xml version="1.0"?><svg width="13" height="6"><path d="M1,5.5 v-4.5 h2.5 M1,3 h1.5 M4.5,1 h3 m-1.5,0 v4 m-1.5,0 h3 M12.5,1 h-2.5 a1,1,0,0,0,-1,1 v2 a1,1,0,0,0,1,1 h1 a1,1,0,0,0,1,-1 v-1 h-1.5" stroke-width="1" stroke="black" fill="none"/></svg>\n')
svg2pdf(tmp,os.path.join(figdir,"fig2.pdf"))

# presentation backgrounds
bgdir = os.path.join("text","presentation","figs","background")
for i in (0,1):
	bgbase = os.path.join(bgdir,str(i))
	svg2pdf(bgbase,bgbase)

# ctu symbol
d = os.path.join(figdir,"ctu")
s = os.path.join(d,"symbol")
sbw = "{}-bw".format(s)
with open("{}.svg".format(sbw)) as f:
	c = f.read()
c = c.replace("000000","0065bd")
with open("{}.svg".format(s),"w") as f:
	f.write(c)
for f in (s,sbw):
	svg2pdf(f,f)
