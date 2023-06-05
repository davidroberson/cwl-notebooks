cwlVersion: v1.2
class: CommandLineTool
label: macs2-call-peaks
$namespaces:
  sbg: https://sevenbridges.com

requirements:
- class: DockerRequirement
  dockerPull: |-
    images.sb.biodatacatalyst.nhlbi.nih.gov/andrewblair/cardiac-compendium:2023042401
- class: InitialWorkDirRequirement
  listing:
  - entryname: call_peaks.sh
    writable: false
    entry: |2-


      source /opt/conda/etc/profile.d/conda.sh
      conda activate macs-py2.7
      macs2 callpeak -t $(inputs.bam.path) \
        -n $(inputs.bam.nameroot).macs2 \
        -f BAM -g hs -p .1 --call-summits --outdir ./

      #Sort narrowPeak file

      bedtools sort \
        -faidx $(inputs.sort_order.path) \
        -i $(inputs.bam.nameroot).macs2_peaks.narrowPeak \
        > $(inputs.bam.nameroot).macs2_peaks.narrowPeak.sorted
- class: InlineJavascriptRequirement

inputs:
- id: bam
  type: File
  secondaryFiles:
  - pattern: .bai
    required: true
  inputBinding:
    position: 0
    shellQuote: true
- id: sort_order
  type: File
  inputBinding:
    position: 0
    shellQuote: true

outputs:
- id: sorted_peaks
  type: File
  outputBinding:
    glob: '*narrowPeak.sorted'
- id: model_r_scripts
  type: File?
  outputBinding:
    glob: '*model.r'
- id: peak_xls
  type: File?
  outputBinding:
    glob: '*peaks.xls'
- id: summits
  type: File?
  outputBinding:
    glob: '*summits.bed'

baseCommand:
- bash
- call_peaks.sh

hints:
- class: sbg:SaveLogs
  value: '*.sh'
id: dave_abc_development_scratch_project_macs2_call_peaks_34
sbg:appVersion:
- v1.2
sbg:content_hash: a5e02d31b9b5609b2270f2b0cafb32a5c07c738292f4fcab15893ec4c8d07bc3e
sbg:contributors:
- dave
sbg:createdBy: dave
sbg:createdOn: 1682016367
