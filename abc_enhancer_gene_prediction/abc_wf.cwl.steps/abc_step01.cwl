cwlVersion: v1.2
class: Workflow
label: abc_step01
doc: |
  # Macs2 Call Peaks and Make Candidate Regions

  ![](img/abc_step01_workflow_graph.svg)



  Install some thigs


  ```sh
  %%sh --out temp_out
  pip install cwltool udocker sbpack
  ```

      ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
      nbconvert 6.1.0 requires mistune<2,>=0.8.1, but you have mistune 2.0.5 which is incompatible.



  ```sh
  %%sh
  cp -r .sevenbridges ~/
  ```


  ```sh
  %%sh
  sbpull nhlbi --unpack dave/abc-development-scratch-project/abc_step01 abc_step01_wf.cwl
  ```

      1: abc_step01_wf.cwl
      2: abc_step01_wf.cwl.steps/macs2_call_peaks.cwl
      3: abc_step01_wf.cwl.steps/makecandidateregions.cwl



  ```python
  %%writefile run_step01_wf.sh
  cwltool --udocker --verbose abc_step01_wf.cwl \
      --bam /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/input_data/Chromatin/wgEncodeUwDnaseK562AlnRep1.chr22.bam \
      --sort_order /sbgenomics/project-files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/chr22 \
      --regions_includelist /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/RefSeqCurated.170308.bed.CollapsedGeneBounds.TSS500bp.chr22.bed \
      --regions_blocklist /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/reference/wgEncodeHg19ConsensusSignalArtifactRegions.bed

  ```


  ```sh
  %%sh --out temp 
  bash run_step01_wf.sh > standard.out
  ```

  print(temp)


  ```sh
  %%sh
  grep -v 'sbg:' abc_step01_wf.cwl


  ```


  ```python
  sudo apt-get update
  sudo apt-get install graphviz
  ```


  ```sh
  %%sh --out temp_out --no-raise-error --err ERR
  cwltool --print-dot abc_step01_wf.cwl | dot -Tsvg > abc_step01_workflow_graph.svg


  ```
$namespaces:
  sbg: https://sevenbridges.com

requirements:
- class: InlineJavascriptRequirement
- class: StepInputExpressionRequirement

inputs:
- id: sort_order
  type: File
  sbg:x: -78.05939483642578
  sbg:y: -24.6160945892334
- id: bam
  type: File
  secondaryFiles:
  - pattern: .bai
    required: true
  sbg:x: -176.66665649414062
  sbg:y: 502.7095031738281
- id: regions_includelist
  type: File
  sbg:x: 403.3333435058594
  sbg:y: 263.66668701171875
- id: regions_blocklist
  type: File
  sbg:x: 321.6666564941406
  sbg:y: 357.3333435058594

outputs:
- id: call_peaks_output
  type: File[]
  outputSource:
  - macs2_call_peaks/model_r_scripts
  - macs2_call_peaks/peak_xls
  - macs2_call_peaks/summits
  sbg:x: 784.0730590820312
  sbg:y: 1.500001311302185
- id: sorted_peaks
  type: File
  outputSource:
  - macs2_call_peaks/sorted_peaks
  sbg:x: 758.4063720703125
  sbg:y: -124.49999237060547
- id: counts
  type: File
  outputSource:
  - makecandidateregions/counts
  sbg:x: 1014.0467529296875
  sbg:y: 378.66668701171875
- id: candidate_regions
  type: File
  outputSource:
  - makecandidateregions/candidate_regions
  sbg:x: 1024.0467529296875
  sbg:y: 529

steps:
- id: macs2_call_peaks
  label: macs2-call-peaks
  in:
  - id: bam
    source: bam
  - id: sort_order
    source: sort_order
  run: abc_step01.cwl.steps/macs2_call_peaks.cwl
  out:
  - id: sorted_peaks
  - id: model_r_scripts
  - id: peak_xls
  - id: summits
  sbg:x: 415.4822998046875
  sbg:y: 11.833348274230957
- id: makecandidateregions
  label: ' MACS2 Call Candidate Regions'
  in:
  - id: narrow_peak
    source: macs2_call_peaks/sorted_peaks
  - id: bam
    source: bam
  - id: chr_sizes
    source: sort_order
  - id: regions_blocklist
    source: regions_blocklist
  - id: regions_includelist
    source: regions_includelist
  run: abc_step01.cwl.steps/makecandidateregions.cwl
  out:
  - id: candidate_regions
  - id: counts
  sbg:x: 722.7396850585938
  sbg:y: 413.46484375
sbg:appVersion:
- v1.2
sbg:content_hash: aa55f6a43cb672e457c5d680892bfd79055e06883b407eba891f8895442926e28
sbg:contributors:
- dave
sbg:createdBy: dave
sbg:createdOn: 1683484068
sbg:id: dave/abc-development-scratch-project/abc_step01/14
sbg:image_url: |-
  https://platform.sb.biodatacatalyst.nhlbi.nih.gov/ns/brood/images/dave/abc-development-scratch-project/abc_step01/14.png
sbg:latestRevision: 14
sbg:modifiedBy: dave
sbg:modifiedOn: 1685499717
sbg:original_source: dave/abc-development-scratch-project/abc_step01/14
sbg:project: dave/abc-development-scratch-project
sbg:projectName: ABC - Development Scratch Project
sbg:publisher: sbg
sbg:revision: 14
sbg:revisionNotes: "Uploaded using sbpack v2022.03.16. \nSource: abc_step01_wf.cwl"
sbg:revisionsInfo:
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683484068
  sbg:revision: 0
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/davidroberson/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683497577
  sbg:revision: 1
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683506044
  sbg:revision: 2
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683507607
  sbg:revision: 3
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/davidroberson/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683551587
  sbg:revision: 4
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683551673
  sbg:revision: 5
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683551854
  sbg:revision: 6
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683553423
  sbg:revision: 7
  sbg:revisionNotes: '"python3 now"'
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1683554138
  sbg:revision: 8
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1685413409
  sbg:revision: 9
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1685470702
  sbg:revision: 10
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1685487147
  sbg:revision: 11
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1685487182
  sbg:revision: 12
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1685488053
  sbg:revision: 13
  sbg:revisionNotes: MultipleInputFeatureRequirement
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1685499717
  sbg:revision: 14
  sbg:revisionNotes: "Uploaded using sbpack v2022.03.16. \nSource: abc_step01_wf.cwl"
sbg:sbgMaintained: false
sbg:validationErrors: []
sbg:workflowLanguage: CWL
