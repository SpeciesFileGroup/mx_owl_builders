#!/bin/bash

export CLASSPATH=.:lib/log4j-1.2.15.jar:lib/oboformat.jar:lib/owlapi-bin.jar

rm oarcs.obo oarcs_base.owl oarcs_images.owl oarcs.owl
curl -L -o oarcs.obo http://oarcs-api.speciesfilegroup.org/projects/99/api/ontology/obo_file
java -Xmx2048M org.obolibrary.cli.OBORunner oarcs.obo -o oarcs_base.owl
curl -L -o oarcs_images.owl http://oarcs-api.speciesfilegroup.org/projects/99/api/ontology/class_depictions
javac OWLFileMerger.java
java OWLFileMerger oarcs_base.owl oarcs_images.owl oarcs.owl
