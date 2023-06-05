cwlVersion: v1.2
class: CommandLineTool
label: Compute ABC Score
doc: |2-

  Compute ABC scores by combining Activity (as calculated by run.neighborhoods.py) and Hi-C.  
$namespaces:
  sbg: https://sevenbridges.com

requirements:
- class: LoadListingRequirement
- class: DockerRequirement
  dockerPull: |-
    images.sb.biodatacatalyst.nhlbi.nih.gov/andrewblair/cardiac-compendium:2023050101
- class: InitialWorkDirRequirement
  listing:
  - entryname: predict.sh
    writable: false
    entry: |2-

      python /usr/src/app/src/predict.py \
      --enhancers $(inputs.enhancers.path) \
      --genes $(inputs.genes.path) \
      --HiCdir $(inputs.hi_c_directory.path) \
      --chrom_sizes $(inputs.chrom_sizes.path) \
      --hic_resolution 5000 \
      --scale_hic_using_powerlaw \
      --threshold .02 \
      --cellType $(inputs.cell_type) \
      --outdir ./ \
      --make_all_putative
- class: InlineJavascriptRequirement

inputs:
- id: enhancers
  doc: EnhancerList.txt
  type: File
  sbg:fileTypes: TXT
- id: genes
  doc: GeneList.txt
  type: File
  sbg:fileTypes: TXT
- id: hi_c_directory
  doc: example_chr22/input_data/HiC/raw/
  type: Directory
  loadListing: deep_listing
- id: chrom_sizes
  doc: example_chr22/reference/chr22
  type: File
  secondaryFiles:
  - pattern: .bed
    required: true
- id: hi_c_resolution
  type: int
- id: cell_type
  type: string

outputs:
- id: all_putattive_predictions
  type: File?
  outputBinding:
    glob: '*EnhancerPredictionsAllPutative.txt.gz'
- id: ForVariantOverlap_shrunk150bp
  type: File?
  outputBinding:
    glob: '*ForVariantOverlap.shrunk150bp.txt.gz'
- id: all_putative_nonexpressed
  type: File?
  outputBinding:
    glob: '*AllPutativeNonExpressedGenes.txt.gz'
- id: enhancer_predictions
  type: File?
  outputBinding:
    glob: '*.bedpe'
- id: other_outputs_enhancer_predictions
  type: File[]?
  outputBinding:
    glob: '*.txt'

baseCommand:
- bash
- predict.sh

hints:
- class: sbg:SaveLogs
  value: '*.sh'
id: dave/abc-development-scratch-project/compute-abc-score/12
sbg:appVersion:
- v1.2
sbg:content_hash: a2c67bd3ad115d5bef2ac3607e8b51a5e49e6c02d257e5e6d3c848ebb7d1b99bc
sbg:contributors:
- dave
sbg:createdBy: dave
sbg:createdOn: 1682905179
sbg:id: dave/abc-development-scratch-project/compute-abc-score/12
sbg:image_url:
sbg:latestRevision: 12
sbg:modifiedBy: dave
sbg:modifiedOn: 1685934373
sbg:project: dave/abc-development-scratch-project
sbg:projectName: ABC - Development Scratch Project
sbg:publisher: sbg
sbg:revision: 12
sbg:revisionNotes: ''
sbg:revisionsInfo:
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682905179
  sbg:revision: 0
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682905357
  sbg:revision: 1
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682905820
  sbg:revision: 2
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682909146
  sbg:revision: 3
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682910319
  sbg:revision: 4
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682911212
  sbg:revision: 5
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682911836
  sbg:revision: 6
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: 
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682955340
  sbg:revision: 7
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: abc_enchancer_gene_prediction/cwl/step03_compute_abc_score.tool.cwl
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682955888
  sbg:revision: 8
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: abc_enchancer_gene_prediction/cwl/step03_compute_abc_score.tool.cwl
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682956239
  sbg:revision: 9
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: abc_enchancer_gene_prediction/cwl/step03_compute_abc_score.tool.cwl
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1682958400
  sbg:revision: 10
  sbg:revisionNotes: |-
    Uploaded using sbpack v2022.03.16. 
    Source: 
    repo: https://github.com/workflow-development-interest-group/workflow-notebooks
    file: abc_enchancer_gene_prediction/cwl/step03_compute_abc_score.tool.cwl
    commit: (uncommitted file)
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1685932191
  sbg:revision: 11
  sbg:revisionNotes: ''
- sbg:modifiedBy: dave
  sbg:modifiedOn: 1685934373
  sbg:revision: 12
  sbg:revisionNotes: ''
sbg:sbgMaintained: false
sbg:validationErrors: []
sbg:workflowLanguage: CWL
