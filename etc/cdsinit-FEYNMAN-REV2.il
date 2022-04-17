;Load the calibre menu
loadi("/CAD/apps7/etc/cdsinit-calibre.il")

;The following customization creates default label [@cellName] in symbols
; which is not in the default IC616 installation
; Followed this: https://support.cadence.com/apex/ArticleAttachmentPortal?id=a1Od0000007MbpAEAS&pageName=ArticleContent&sq=0050V000006mDk8QAE_201862373422325
;
tsgTemplateMasters = list( 
list("digital" "/CAD/apps7/etc/default.tsg.local") 
list("artist" "/CAD/apps7/etc/artist.tsg.local") 
list("PCB" (prependInstallPath "samples/symbolGen/package.tsg")) 
list("metric" (prependInstallPath "samples/symbolGen/metric.tsg")) 
) 
;;If you want to change the default, uncomment the following
;;schSetEnv("tsgTemplateType" "digital")
 
;;
; Set the project directory to the local directory
envSetVal("asimenv.startup" "projectDir" 'string strcat("/home/local/simulation/" getShellEnvVar("USER") ))

; Set Spectre as the default simulator
envSetVal("asimenv.startup" "simulator" 'string "spectre")

; Set default models for spectre FIXME: Add all the X-Fab 
;envSetVal("spectre.envOpts" "modelFiles" 'string "$HOME/ncsu-cdk-1.6.0.beta/models/spectre/standalone/ami06N.m $HOME/ncsu-cdk-1.6.0.beta/models/spectre/standalone/ami06P.m")

; Auto-hides options for all tools, such as copy, move, create instance, etc. Press F3 to show options.
; envSetVal("ui" "showOptionForms" 'boolean nil) ; Uncomment this to enable. I didn't want to suprise anyone with this feature.

; Auto select "Cellview" when saving/loading states. Default: nil
envSetVal("asimenv" "saveAsCellview" 'boolean t)

; Display pin names by default in layout
envSetVal("layout" "displayPinNames" 'boolean t)

; Set stop level to 32 to show everything in layout
;envSetVal("layout" "stopLevel" 'int 32)

; Disable warning for a 4-way interesection wire aka solder dot crossover
envSetVal("schematic" "srcSolderOnCrossover" 'cyclic "ignored")

; Set the graph background to white
;envSetVal("viva.rectGraph" "background" 'string "white")

; Set the graph foreground to black
;envSetVal("viva.rectGraph" "foreground" 'string "black")
 

; Help changing the default style/color/thickness of a waveform or trace in ViVA (Cadence's waveform viewer) is found here.

; Set graph axis font and size
;envSetVal("viva.axis" "font" 'string "Fixed [Misc],12,-1,5,50,0,0,0,0,0")

; Set graph marker font and size
;envSetVal("viva.pointMarker" "font" 'string "Fixed [Misc],12,-1,5,50,0,0,0,0,0")

; In ViVA there is a vertical marker (bindkey v), a horizontal marker (bindkey h), and a difference marker for each direction (bindkey d). You can modify these markers' fonts and sizes with the following lines:

; Set vertical marker font and size (36 point font below)  
;envSetVal("viva.vertMarker" "font" 'string "Fixed [Misc],36,-1,5,50,0,0,0,0,0") 

; Set horizontal marker font and size (36 point font below)  
;envSetVal("viva.horizMarker" "font" 'string "Fixed [Misc],36,-1,5,50,0,0,0,0,0")

; Set vertical and horizontal dx/dy markers' font and size (36 point font below)  
;envSetVal("viva.multiDeltaMarker" "font" 'string "Fixed [Misc],36,-1,5,50,0,0,0,0,0") 

;-------------------------------------------------------------------------------------
; The following work for plotting expressions with the calculator
 
; Set line thickness to thick 
envSetVal("viva.trace" "lineThickness" 'string "thick")

; Set line type to solid 
envSetVal("viva.trace" "lineStyle" 'string "solid")
