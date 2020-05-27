# metabase-script
This repository contains the SQL script we use for supporting activities with `ESPEN Collect`. These scripts will be useful for creating `Metabase` `dashboard` and `pulse`. To use this repository, you need to know the SQL language.

## Naming convention of the form
Here is how we will name the ESPEN Collect Electronic Form for DSA
`<Country IS0 Code 2>_<Disease abbreviation>_<Survey Abbreviation>_<Form Index>_<Form Designation>_<year and month>`. Exemple: `bf_lf_tas2_1_sites_202004`, `bf_lf_tas2_2_participant_202004`

### Definition
- **Country IS0 Code 2**: International country ISO code with two character ([https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2))
- **Disease abbreviation**:
  - *oncho* : Onchocerciasis
  - *lf* : Lymphatic Filariasis
  - *sch* : Schistosomiasis
  - *sth* : Soil Transmitted Helminths
  - *sch_sth*: Schistosomiasis and Soil Transmitted Helminths

- **Survey Abbreviation**
  - **Onchocerciasis**
    - *oem*: Onchocerciasis Elimination Mapping
    - *opsmda*: Onchocerciasis Pre-STOP MDA Survey
    - *smdas*: STOP MDA Survey
    - *oss*: Onchocerciasis Surveillance survey
    - *ois*:  Onchocerciasis Impact Assessment
    - *bsa*: Breeding Sites Assessment
  
  - **Lymphatic Filariasis**
    - *tas*: Transmission Assessment Survey
    - *ptas*: Pre Transmission Assessment Survey
    - *sss*: Sentinel Site Survey
    - *scs*: Spot Check Survey
  
  - **Schistosomiasis & Soil Transmitted Helminths**
    - *sss*: Sentinel Site Survey
    - *ssia*:  SCH/STH Impact Assessment

- **Form Index**: The number of form. Generally, the village/school come first followed by the participant form and the diagnostic form

- **Form Designation**: The form designation. ex: cluster, site, participant

