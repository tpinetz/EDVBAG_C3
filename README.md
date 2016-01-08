# EDVBAG_C3

## Main Methode

Die Main Methode ist unser Example um zu zeigen, wie das Framework funktioniert. Hierbei wird ein sinnvolles example geladen und die output Images ausgegeben. Bei erfolgreichem Ausführen sollte man die Distanz von ungefähr 2.4m und eine Geschwindigkeit von ungefähr 4.8 m/s sehen, je nachdem wie gut die random initialisierung von RANSAC ausgefallen ist. Die Bilder werden aus dem Assets Ordner geladen. Dieser muss sich im selben Verzeichnis befinden.

## Radarfalle Methode

Das ist die eigentliche Methode, welche benutzt wird um das Framework anzusteuern. Wir haben folgende Parameter für diese Methode:

* markerString.. Ort des Bildes vom Marker.
* markerSize.. reelle Größe des Markers in mm.
* strelType.. Die Art des Strukturelement (	'rectangle', 'square', 'diamond', ...)
* inputImageString.. Ort des Bildes mit Marker zur Berechnung der Distanz.
* image1String.. Ort des ersten Bildes der Geschwindigkeitsmessung.
* image2String.. Ort des zweiten Bildes der Geschwindigkeitsmesssung.

### Aufgerufene Methoden von Radarfalle

* distanceToMarker(inputImage,marker,markerSize)
  * Speeded Up Robust Features (SURF)
  * Random Sample Consensus (RANSAC)
* calculateDistance(image1,image2,strelType)
  * Threshold by Otsu
  * Closing
  * Connected Component Labelling (CCL)
