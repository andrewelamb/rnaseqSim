#!/usr/bin/env cwl-runner
#
# Authors: Allison Creason, Kristen Dang, Kyle Ellrott, Ryan Spangler

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [modify_model_tpm_for_diploid.R]

doc: "Model Isoform Expression"

hints:
  DockerRequirement:
    dockerPull: alliecreason/model_isoforms

requirements:
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 
    ramMin: 

inputs:

  tpm:
    type: File
    inputBinding:
      position: 1
      prefix: --TPM

  gtf:
    type: File
    inputBinding:
      position: 1
      prefix: --gtf
  
  depth:
    type: int
    inputBinding:
      position: 1
      prefix: --targetDepth

outputs:

  isoformTPM:
    type: File
    outputBinding:
      glob: $("*results_modDiploid_" + $depth)

  fusionTPM:
    type: File
    outputBinding:
      glob: $("*results_modDiploidFusionOnly_" + $depth)