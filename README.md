# XRSE
A syntactic parser for radiology reports

Raw data not included here. Can be found at mimic.physionet.org

Intermediate datasets referenced in the scripts, however, not included here due to privacy and confidentiality concerns.

I used the free trial version of the IBM Watson Knowledge Studio.

- **puredescriptor.csv, impuredescriptor.csv, instrument.csv, organ.csv, partorgan.csv, system.csv, symptom.csv, pathology.csv, ageDict.csv, dt.comboDict.csv:** Preannotation lists in a form accepted by the IBM Knowledge Studio.

- **confusing bits.csv:** Certains points of confusion about allocating preannotation categories to words.

- **90plus.R:** Patients aged >90 had metadata tags inserted in the reports instead of their age. This script found and replaced those tags with plausible numerical ages.

- **dataImport.R:** Data import and metadata removal script.

- **datmod.R:** Dates within the reports were also obscured with metadata tags. This script turns the tags into actual dates.

- **setcreator.R:** I don't remember why this exists...