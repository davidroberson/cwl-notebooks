# Macs2 Call Peaks and Make Candidate Regions

![](abc_step01_workflow_graph.svg)



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
