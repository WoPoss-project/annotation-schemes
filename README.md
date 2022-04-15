# Annotation schemas
## Annotation scheme-related files of the WoPoss project

In this repo you can find:

- Different files related to the customization of the annotation platform INCEpTION (see [annotation_platform](https://github.com/WoPoss/annotation-schemes/tree/master/annotation_platform))

	- The description of the different layers of annotation of the WoPoss project (as required in INCEpTION). This description is formalized in JSON and it includes the tagsets (see [annotation_platform/layers](https://github.com/WoPoss/annotation-schemes/tree/master/annotation_platform/layers)).

	- The definition of the annotation constraints (as required in INCEpTION) (see [annotation_platform/constraints](https://github.com/WoPoss/annotation-schemes/tree/master/annotation_platform/constraints))

	- An example of the WoPoss annotation to play around with in INCEpTION (see [annotation_platform/demo](https://github.com/WoPoss/annotation-schemes/tree/master/annotation_platform/demo)). The instructions are available [here](http://woposs.unil.ch/db.php).

- The TEI schemas:
	- [Feature system declaration](https://github.com/WoPoss-project/annotation-schemes/blob/master/FSD/fsDecl-to-Schematron.xsl) (and [XSLT file that transforms this declaration in Schematron rules](https://github.com/WoPoss-project/annotation-schemes/blob/master/FSD/fsDecl-to-Schematron.xsl))
	- ODD files: [main ODD file](https://github.com/WoPoss-project/annotation-schemes/blob/master/schemas/tei_woposs.odd) and [Gospels-specific file](https://github.com/WoPoss-project/annotation-schemes/blob/master/schemas/tei_woposs_gospels.odd) and [metadata master file ODD](https://github.com/WoPoss-project/annotation-schemes/blob/master/schemas/tei_woposs_metadata.odd)
 	- [RelaxNG files](https://github.com/WoPoss-project/annotation-schemes/tree/master/schemas/out)
