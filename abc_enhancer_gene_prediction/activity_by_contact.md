Install some thigs


```sh
%%sh --out temp_out
pip install cwltool udocker sbpack
```

    ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
    nbconvert 6.1.0 requires mistune<2,>=0.8.1, but you have mistune 2.0.5 which is incompatible.



```sh
%%sh --out temp_out
cwltool --udocker --verbose step01.cwl \
    --bam /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/input_data/Chromatin/wgEncodeUwDnaseK562AlnRep1.chr22.bam \
    --sort_order /sbgenomics/project-files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/chr22 \
    --regions_includelist /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/RefSeqCurated.170308.bed.CollapsedGeneBounds.TSS500bp.chr22.bed \
    --regions_blocklist /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/reference/wgEncodeHg19ConsensusSignalArtifactRegions.bed

```

    [1;30mINFO[0m /opt/conda/bin/cwltool 3.1.20230527103121
    [1;30mINFO[0m Resolved 'step01.cwl' to 'file:///sbgenomics/workspace/step01.cwl'
    step01.cwl:138:7: Warning: checking item
                      Warning:   Field 'class' contains undefined reference to
                      'https://sevenbridges.comSaveLogs'
    step01.cwl:138:7: Warning: checking item
                      Warning:   Field 'class' contains undefined reference to
                      'https://sevenbridges.comSaveLogs'
    step01.cwl:454:7: Warning: checking item
                      Warning:   Field 'class' contains undefined reference to
                      'https://sevenbridges.comSaveLogs'
    step01.cwl:454:7: Warning: checking item
                      Warning:   Field 'class' contains undefined reference to
                      'https://sevenbridges.comSaveLogs'
    [1;30mINFO[0m step01.cwl:138:7: Unknown hint https://sevenbridges.comSaveLogs
    [1;30mINFO[0m step01.cwl:454:7: Unknown hint https://sevenbridges.comSaveLogs
    [1;30mINFO[0m [workflow ] start
    [1;30mINFO[0m [workflow ] starting step macs2_call_peaks
    [1;30mINFO[0m [step macs2_call_peaks] start
    [1;30mINFO[0m ['udocker', 'pull', 'images.sb.biodatacatalyst.nhlbi.nih.gov/andrewblair/cardiac-compendium:2023042401']
    Info: creating repo: /home/jovyan/.udocker
    Info: udocker command line interface 1.3.8
    Info: searching for udockertools 1.2.9
    Info: installing udockertools 1.2.9
    Info: installation of udockertools successful
    Info: downloading layer sha256:a603fa5e3b4127f210503aaa6189abf6286ee5a73deeaab460f8f33ebc6b64e2
    Info: downloading layer sha256:a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
    Info: downloading layer sha256:a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
    Info: downloading layer sha256:a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
    Info: downloading layer sha256:e732803b8b3a678771339f313716f3acfc8e30d8efd5cee988ed1bba787e7595
    Info: downloading layer sha256:a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
    Info: downloading layer sha256:af97898598424f5a977b99d13215ec4933881f08ea6c6c8036df18208dce1469
    Info: downloading layer sha256:4a42826e09b2bdd9660d9a324ce3e78c61752bcf4ce1294a6dc8b8624d42783a
    Info: downloading layer sha256:f73a961cfbce5a6db3d64d54010d57244261bf0cbfff05e028fcab40c18c9f28
    Info: downloading layer sha256:a4f214a619fb24fe2672e2e4ae04eca3b14362db330ad0d762179d518b16ffc1
    Info: downloading layer sha256:2fc9fc94e4c4e61abf36dc539c03a6c096389a027c903474c2caaa753d84e38c
    Info: downloading layer sha256:f03a7f3b22e42ebca5291dfb24c59f86a6a227f58b23572a02838d2e57b32a2e
    Info: downloading layer sha256:a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
    Info: downloading layer sha256:1f6ac0cff2a016ca297de3ce27bb12d3b188f0dcc6090279740aa27739ea6fef
    Info: downloading layer sha256:a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
    Info: downloading layer sha256:b4245fcd0e0b97694f386d75d6d9b61ef89e7735726ac12f0d59988aab2b3d57
    Info: downloading layer sha256:61680d9fdae5e58106a6bf8064d32755520813c526b81ae758bbeac52addf4f7
    Info: downloading layer sha256:fda22127a020fcc5efb7d4a0378b7d9a22a3338cd308b3f50cb3d5f96a0eca7e
    Info: downloading layer sha256:aef0b492a3a46a27e1d187b81c98a5c70b11b9724b361e77cc8a0eff0d396549
    Info: downloading layer sha256:302839ca5ff03970c353f4c98af459e7da3334e10b9727c0c2b406c5eb6c5146
    [1;30mINFO[0m [job macs2_call_peaks] /tmp/0b8usqud$ udocker \
        --quiet \
        run \
        --nobanner \
        --volume=/tmp/0b8usqud:/akiukT \
        --volume=/tmp/07rhzz1w:/tmp \
        --volume=/sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/input_data/Chromatin/wgEncodeUwDnaseK562AlnRep1.chr22.bam:/var/lib/cwl/stg8f77c300-d28d-4566-8253-b61c792e500c/wgEncodeUwDnaseK562AlnRep1.chr22.bam \
        --volume=/sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/input_data/Chromatin/wgEncodeUwDnaseK562AlnRep1.chr22.bam.bai:/var/lib/cwl/stg8f77c300-d28d-4566-8253-b61c792e500c/wgEncodeUwDnaseK562AlnRep1.chr22.bam.bai \
        --volume=/sbgenomics/project-files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/chr22:/var/lib/cwl/stgd8276889-f000-401f-bc4c-764f8f45739f/chr22 \
        --workdir=/akiukT \
        --rm \
        --env=TMPDIR=/tmp \
        --env=HOME=/akiukT \
        images.sb.biodatacatalyst.nhlbi.nih.gov/andrewblair/cardiac-compendium:2023042401 \
        bash \
        call_peaks.sh \
        /var/lib/cwl/stg8f77c300-d28d-4566-8253-b61c792e500c/wgEncodeUwDnaseK562AlnRep1.chr22.bam \
        /var/lib/cwl/stgd8276889-f000-401f-bc4c-764f8f45739f/chr22
    INFO  @ Tue, 30 May 2023 22:43:58: 
    # Command line: callpeak -t /var/lib/cwl/stg8f77c300-d28d-4566-8253-b61c792e500c/wgEncodeUwDnaseK562AlnRep1.chr22.bam -n wgEncodeUwDnaseK562AlnRep1.chr22.macs2 -f BAM -g hs -p .1 --call-summits --outdir ./
    # ARGUMENTS LIST:
    # name = wgEncodeUwDnaseK562AlnRep1.chr22.macs2
    # format = BAM
    # ChIP-seq file = ['/var/lib/cwl/stg8f77c300-d28d-4566-8253-b61c792e500c/wgEncodeUwDnaseK562AlnRep1.chr22.bam']
    # control file = None
    # effective genome size = 2.70e+09
    # band width = 300
    # model fold = [5, 50]
    # pvalue cutoff = 1.00e-01
    # qvalue will not be calculated and reported as -1 in the final output.
    # The maximum gap between significant sites is assigned as the read length/tag size.
    # The minimum length of peaks is assigned as the predicted fragment length "d".
    # Larger dataset will be scaled towards smaller dataset.
    # Range for calculating regional lambda is: 10000 bps
    # Broad region calling is off
    # Paired-End mode is off
    # Searching for subpeak summits is on
     
    INFO  @ Tue, 30 May 2023 22:43:58: #1 read tag files... 
    INFO  @ Tue, 30 May 2023 22:43:58: #1 read treatment tags... 
    INFO  @ Tue, 30 May 2023 22:44:00: 434301 reads have been read. 
    INFO  @ Tue, 30 May 2023 22:44:00: #1 tag size is determined as 36 bps 
    INFO  @ Tue, 30 May 2023 22:44:00: #1 tag size = 36.0 
    INFO  @ Tue, 30 May 2023 22:44:00: #1  total tags in treatment: 434301 
    INFO  @ Tue, 30 May 2023 22:44:00: #1 user defined the maximum tags... 
    INFO  @ Tue, 30 May 2023 22:44:00: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
    INFO  @ Tue, 30 May 2023 22:44:00: #1  tags after filtering in treatment: 330933 
    INFO  @ Tue, 30 May 2023 22:44:00: #1  Redundant rate of treatment: 0.24 
    INFO  @ Tue, 30 May 2023 22:44:00: #1 finished! 
    INFO  @ Tue, 30 May 2023 22:44:00: #2 Build Peak Model... 
    INFO  @ Tue, 30 May 2023 22:44:00: #2 looking for paired plus/minus strand peaks... 
    INFO  @ Tue, 30 May 2023 22:44:00: #2 number of paired peaks: 2488 
    INFO  @ Tue, 30 May 2023 22:44:00: start model_add_line... 
    INFO  @ Tue, 30 May 2023 22:44:00: start X-correlation... 
    INFO  @ Tue, 30 May 2023 22:44:00: end of X-cor 
    INFO  @ Tue, 30 May 2023 22:44:00: #2 finished! 
    INFO  @ Tue, 30 May 2023 22:44:00: #2 predicted fragment length is 297 bps 
    INFO  @ Tue, 30 May 2023 22:44:00: #2 alternative fragment length(s) may be 297 bps 
    INFO  @ Tue, 30 May 2023 22:44:00: #2.2 Generate R script for model : ./wgEncodeUwDnaseK562AlnRep1.chr22.macs2_model.r 
    INFO  @ Tue, 30 May 2023 22:44:00: #3 Call peaks... 
    INFO  @ Tue, 30 May 2023 22:44:00: #3 Going to call summits inside each peak ... 
    INFO  @ Tue, 30 May 2023 22:44:00: #3 Call peaks with given -log10pvalue cutoff: 1.00000 ... 
    INFO  @ Tue, 30 May 2023 22:44:00: #3 Pre-compute pvalue-qvalue table... 
    INFO  @ Tue, 30 May 2023 22:44:01: #3 Call peaks for each chromosome... 
    INFO  @ Tue, 30 May 2023 22:44:09: #4 Write output xls file... ./wgEncodeUwDnaseK562AlnRep1.chr22.macs2_peaks.xls 
    INFO  @ Tue, 30 May 2023 22:44:09: #4 Write peak in narrowPeak format file... ./wgEncodeUwDnaseK562AlnRep1.chr22.macs2_peaks.narrowPeak 
    INFO  @ Tue, 30 May 2023 22:44:09: #4 Write summits bed file... ./wgEncodeUwDnaseK562AlnRep1.chr22.macs2_summits.bed 
    INFO  @ Tue, 30 May 2023 22:44:09: Done! 
    [1;30mINFO[0m [job macs2_call_peaks] Max memory used: 23MiB
    [1;30mERROR[0m [31m[job macs2_call_peaks] Job error:
    ("Error collecting output for parameter 'peak_xls': step01.cwl:127:9: Did not find output file with glob pattern: ['*peak.xls'].", {})[0m
    [1;30mWARNING[0m [33m[job macs2_call_peaks] completed permanentFail[0m
    [1;30mERROR[0m [31m[step macs2_call_peaks] Output is missing expected field https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/dave/abc-development-scratch-project/abc_step01/10/raw/#macs2_call_peaks/sorted_peaks[0m
    [1;30mERROR[0m [31m[step macs2_call_peaks] Output is missing expected field https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/dave/abc-development-scratch-project/abc_step01/10/raw/#macs2_call_peaks/model_r_scripts[0m
    [1;30mERROR[0m [31m[step macs2_call_peaks] Output is missing expected field https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/dave/abc-development-scratch-project/abc_step01/10/raw/#macs2_call_peaks/peak_xls[0m
    [1;30mERROR[0m [31m[step macs2_call_peaks] Output is missing expected field https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/dave/abc-development-scratch-project/abc_step01/10/raw/#macs2_call_peaks/summits[0m
    [1;30mWARNING[0m [33m[step macs2_call_peaks] completed permanentFail[0m
    [1;30mERROR[0m [31m[workflow ] Cannot collect workflow output: Workflow contains multiple inbound links to a single parameter but MultipleInputFeatureRequirement is not declared.[0m
    [1;30mINFO[0m [workflow ] completed permanentFail
    [1;30mWARNING[0m [33mFinal process status is permanentFail[0m



    ---------------------------------------------------------------------------

    CalledProcessError                        Traceback (most recent call last)

    /tmp/ipykernel_69/3568948680.py in <module>
    ----> 1 get_ipython().run_cell_magic('sh', '--out temp_out', 'cwltool --udocker --verbose step01.cwl \\\n    --bam /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/input_data/Chromatin/wgEncodeUwDnaseK562AlnRep1.chr22.bam \\\n    --sort_order /sbgenomics/project-files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/chr22 \\\n    --regions_includelist /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/RefSeqCurated.170308.bed.CollapsedGeneBounds.TSS500bp.chr22.bed \\\n    --regions_blocklist /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/reference/wgEncodeHg19ConsensusSignalArtifactRegions.bed\n')
    

    /opt/conda/lib/python3.9/site-packages/IPython/core/interactiveshell.py in run_cell_magic(self, magic_name, line, cell)
       2401             with self.builtin_trap:
       2402                 args = (magic_arg_s, cell)
    -> 2403                 result = fn(*args, **kwargs)
       2404             return result
       2405 


    /opt/conda/lib/python3.9/site-packages/IPython/core/magics/script.py in named_script_magic(line, cell)
        140             else:
        141                 line = script
    --> 142             return self.shebang(line, cell)
        143 
        144         # write a basic docstring:


    /opt/conda/lib/python3.9/site-packages/decorator.py in fun(*args, **kw)
        230             if not kwsyntax:
        231                 args, kw = fix(args, kw, sig)
    --> 232             return caller(func, *(extras + args), **kw)
        233     fun.__name__ = func.__name__
        234     fun.__doc__ = func.__doc__


    /opt/conda/lib/python3.9/site-packages/IPython/core/magic.py in <lambda>(f, *a, **k)
        185     # but it's overkill for just that one bit of state.
        186     def magic_deco(arg):
    --> 187         call = lambda f, *a, **k: f(*a, **k)
        188 
        189         if callable(arg):


    /opt/conda/lib/python3.9/site-packages/IPython/core/magics/script.py in shebang(self, line, cell)
        243             sys.stderr.flush()
        244         if args.raise_error and p.returncode!=0:
    --> 245             raise CalledProcessError(p.returncode, cell, output=out, stderr=err)
        246 
        247     def _run_script(self, p, cell, to_close):


    CalledProcessError: Command 'b'cwltool --udocker --verbose step01.cwl \\\n    --bam /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/input_data/Chromatin/wgEncodeUwDnaseK562AlnRep1.chr22.bam \\\n    --sort_order /sbgenomics/project-files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/chr22 \\\n    --regions_includelist /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/example_chr22/reference/RefSeqCurated.170308.bed.CollapsedGeneBounds.TSS500bp.chr22.bed \\\n    --regions_blocklist /sbgenomics/project-files/organized_files/ABC-Enhancer-Gene-Prediction/reference/wgEncodeHg19ConsensusSignalArtifactRegions.bed\n'' returned non-zero exit status 1.



```sh
%%sh
cwltool -h
```

    usage: cwltool [-h] [--basedir BASEDIR] [--outdir OUTDIR] [--log-dir LOG_DIR]
                   [--parallel]
                   [--preserve-environment ENVVAR | --preserve-entire-environment]
                   [--rm-container | --leave-container]
                   [--cidfile-dir CIDFILE_DIR] [--cidfile-prefix CIDFILE_PREFIX]
                   [--tmpdir-prefix TMPDIR_PREFIX]
                   [--tmp-outdir-prefix TMP_OUTDIR_PREFIX | --cachedir CACHEDIR]
                   [--rm-tmpdir | --leave-tmpdir]
                   [--move-outputs | --leave-outputs | --copy-outputs]
                   [--enable-pull | --disable-pull]
                   [--rdf-serializer RDF_SERIALIZER] [--eval-timeout EVAL_TIMEOUT]
                   [--provenance PROVENANCE] [--enable-user-provenance]
                   [--disable-user-provenance] [--enable-host-provenance]
                   [--disable-host-provenance] [--orcid ORCID]
                   [--full-name CWL_FULL_NAME]
                   [--print-rdf | --print-dot | --print-pre | --print-deps | --print-input-deps | --pack | --version | --validate | --print-supported-versions | --print-subgraph | --print-targets | --make-template]
                   [--strict | --non-strict] [--skip-schemas]
                   [--no-doc-cache | --doc-cache] [--verbose | --quiet | --debug]
                   [--write-summary WRITE_SUMMARY] [--strict-memory-limit]
                   [--strict-cpu-limit] [--timestamps] [--js-console]
                   [--disable-js-validation]
                   [--js-hint-options-file JS_HINT_OPTIONS_FILE]
                   [--user-space-docker-cmd CMD | --udocker | --singularity | --podman | --no-container]
                   [--tool-help] [--relative-deps {primary,cwd}] [--enable-dev]
                   [--enable-ext] [--enable-color | --disable-color]
                   [--default-container DEFAULT_CONTAINER] [--no-match-user]
                   [--custom-net CUSTOM_NET]
                   [--enable-ga4gh-tool-registry | --disable-ga4gh-tool-registry]
                   [--add-ga4gh-tool-registry GA4GH_TOOL_REGISTRIES]
                   [--on-error {stop,continue}]
                   [--compute-checksum | --no-compute-checksum]
                   [--relax-path-checks] [--force-docker-pull] [--no-read-only]
                   [--overrides OVERRIDES]
                   [--target TARGET | --single-step SINGLE_STEP | --single-process SINGLE_PROCESS]
                   [--mpi-config-file MPI_CONFIG_FILE]
                   [cwl_document] ...
    
    Reference executor for Common Workflow Language standards. Not for production
    use.
    
    positional arguments:
      cwl_document          path or URL to a CWL Workflow, CommandLineTool, or
                            ExpressionTool. If the `inputs_object` has a
                            `cwl:tool` field indicating the path or URL to the
                            cwl_document, then the `cwl_document` argument is
                            optional.
      inputs_object         path or URL to a YAML or JSON formatted description of
                            the required input values for the given
                            `cwl_document`.
    
    optional arguments:
      -h, --help            show this help message and exit
      --basedir BASEDIR
      --outdir OUTDIR       Output directory. The default is the current
                            directory.
      --log-dir LOG_DIR     Log your tools stdout/stderr to this location outside
                            of container This will only log stdout/stderr if you
                            specify stdout/stderr in their respective fields or
                            capture it as an output
      --parallel            [experimental] Run jobs in parallel.
      --preserve-environment ENVVAR
                            Preserve specific environment variable when running
                            CommandLineTools. May be provided multiple times. By
                            default PATH is preserved when not running in a
                            container.
      --preserve-entire-environment
                            Preserve all environment variables when running
                            CommandLineTools without a software container.
      --rm-container        Delete Docker container used by jobs after they exit
                            (default)
      --leave-container     Do not delete Docker container used by jobs after they
                            exit
      --tmpdir-prefix TMPDIR_PREFIX
                            Path prefix for temporary directories. If --tmpdir-
                            prefix is not provided, then the prefix for temporary
                            directories is influenced by the value of the TMPDIR,
                            TEMP, or TMP environment variables. Taking those into
                            consideration, the current default is /tmp/.
      --tmp-outdir-prefix TMP_OUTDIR_PREFIX
                            Path prefix for intermediate output directories.
                            Defaults to the value of --tmpdir-prefix.
      --cachedir CACHEDIR   Directory to cache intermediate workflow outputs to
                            avoid recomputing steps. Can be very helpful in the
                            development and troubleshooting of CWL documents.
      --rm-tmpdir           Delete intermediate temporary directories (default)
      --leave-tmpdir        Do not delete intermediate temporary directories
      --move-outputs        Move output files to the workflow output directory and
                            delete intermediate output directories (default).
      --leave-outputs       Leave output files in intermediate output directories.
      --copy-outputs        Copy output files to the workflow output directory and
                            don't delete intermediate output directories.
      --enable-pull         Try to pull Docker images
      --disable-pull        Do not try to pull Docker images
      --rdf-serializer RDF_SERIALIZER
                            Output RDF serialization format used by --print-rdf
                            (one of turtle (default), n3, nt, xml)
      --eval-timeout EVAL_TIMEOUT
                            Time to wait for a Javascript expression to evaluate
                            before giving an error, default 60s.
      --print-rdf           Print corresponding RDF graph for workflow and exit
      --print-dot           Print workflow visualization in graphviz format and
                            exit
      --print-pre           Print CWL document after preprocessing.
      --print-deps          Print CWL document dependencies.
      --print-input-deps    Print input object document dependencies.
      --pack                Combine components into single document and print.
      --version             Print version and exit
      --validate            Validate CWL document only.
      --print-supported-versions
                            Print supported CWL specs.
      --print-subgraph      Print workflow subgraph that will execute. Can
                            combined with --target or --single-step
      --print-targets       Print targets (output parameters)
      --make-template       Generate a template input object
      --strict              Strict validation (unrecognized or out of place fields
                            are error)
      --non-strict          Lenient validation (ignore unrecognized fields)
      --skip-schemas        Skip loading of schemas
      --no-doc-cache        Disable disk cache for documents loaded over HTTP
      --doc-cache           Enable disk cache for documents loaded over HTTP
      --verbose             Default logging
      --quiet               Only print warnings and errors.
      --debug               Print even more logging
      --write-summary WRITE_SUMMARY, -w WRITE_SUMMARY
                            Path to write the final output JSON object to. Default
                            is stdout.
      --strict-memory-limit
                            When running with software containers and the Docker
                            engine, pass either the calculated memory allocation
                            from ResourceRequirements or the default of 1 gigabyte
                            to Docker's --memory option.
      --strict-cpu-limit    When running with software containers and the Docker
                            engine, pass either the calculated cpu allocation from
                            ResourceRequirements or the default of 1 core to
                            Docker's --cpu option. Requires docker version >=
                            v1.13.
      --timestamps          Add timestamps to the errors, warnings, and
                            notifications.
      --js-console          Enable javascript console output
      --disable-js-validation
                            Disable javascript validation.
      --js-hint-options-file JS_HINT_OPTIONS_FILE
                            File of options to pass to jshint. This includes the
                            added option "includewarnings".
      --user-space-docker-cmd CMD
                            (Linux/OS X only) Specify the path to udocker. Implies
                            --udocker
      --udocker             (Linux/OS X only) Use the udocker runtime for running
                            containers (equivalent to --user-space-docker-
                            cmd=udocker).
      --singularity         [experimental] Use Singularity runtime for running
                            containers. Requires Singularity v2.6.1+ and Linux
                            with kernel version v3.18+ or with overlayfs support
                            backported.
      --podman              [experimental] Use Podman runtime for running
                            containers.
      --no-container        Do not execute jobs in a Docker container, even when
                            `DockerRequirement` is specified under `hints`.
      --tool-help           Print command line help for tool
      --relative-deps {primary,cwd}
                            When using --print-deps, print paths relative to
                            primary file or current working directory.
      --enable-dev          Enable loading and running unofficial development
                            versions of the CWL standards.
      --enable-ext          Enable loading and running 'cwltool:' extensions to
                            the CWL standards.
      --enable-color        Enable logging color (default enabled)
      --disable-color       Disable colored logging (default false)
      --default-container DEFAULT_CONTAINER
                            Specify a default software container to use for any
                            CommandLineTool without a DockerRequirement.
      --no-match-user       Disable passing the current uid to `docker run --user`
      --custom-net CUSTOM_NET
                            Passed to `docker run` as the '--net' parameter when
                            NetworkAccess is true, which is its default setting.
      --enable-ga4gh-tool-registry
                            Enable tool resolution using GA4GH tool registry API
      --disable-ga4gh-tool-registry
                            Disable tool resolution using GA4GH tool registry API
      --add-ga4gh-tool-registry GA4GH_TOOL_REGISTRIES
                            Add a GA4GH tool registry endpoint to use for
                            resolution, default ['https://dockstore.org/api']
      --on-error {stop,continue}
                            Desired workflow behavior when a step fails. One of
                            'stop' (do not submit any more steps) or 'continue'
                            (may submit other steps that are not downstream from
                            the error). Default is 'stop'.
      --compute-checksum    Compute checksum of contents while collecting outputs
      --no-compute-checksum
                            Do not compute checksum of contents while collecting
                            outputs
      --relax-path-checks   Relax requirements on path names to permit spaces and
                            hash characters.
      --force-docker-pull   Pull latest software container image even if it is
                            locally present
      --no-read-only        Do not set root directory in the container as read-
                            only
      --overrides OVERRIDES
                            Read process requirement overrides from file.
      --target TARGET, -t TARGET
                            Only execute steps that contribute to listed targets
                            (can be provided more than once).
      --single-step SINGLE_STEP
                            Only executes a single step in a workflow. The input
                            object must match that step's inputs. Can be combined
                            with --print-subgraph.
      --single-process SINGLE_PROCESS
                            Only executes the underlying Process (CommandLineTool,
                            ExpressionTool, or sub-Workflow) for the given step in
                            a workflow. This will not include any step-level
                            processing: 'scatter', 'when'; and there will be no
                            processing of step-level 'default', or 'valueFrom'
                            input modifiers. However, requirements/hints from the
                            step or parent workflow(s) will be inherited as
                            usual.The input object must match that Process's
                            inputs.
      --mpi-config-file MPI_CONFIG_FILE
                            Platform specific configuration for MPI (parallel
                            launcher, its flag etc). See README section 'Running
                            MPI-based tools' for details of the format.
    
    Options for recording the Docker container identifier into a file.:
      --cidfile-dir CIDFILE_DIR
                            Store the Docker container ID into a file in the
                            specified directory.
      --cidfile-prefix CIDFILE_PREFIX
                            Specify a prefix to the container ID filename. Final
                            file name will be followed by a timestamp. The default
                            is no prefix.
    
    Options for recording provenance information of the execution:
      --provenance PROVENANCE
                            Save provenance to specified folder as a Research
                            Object that captures and aggregates workflow execution
                            and data products.
      --enable-user-provenance
                            Record user account info as part of provenance.
      --disable-user-provenance
                            Do not record user account info in provenance.
      --enable-host-provenance
                            Record host info as part of provenance.
      --disable-host-provenance
                            Do not record host info in provenance.
      --orcid ORCID         Record user ORCID identifier as part of provenance,
                            e.g. https://orcid.org/0000-0002-1825-0097 or
                            0000-0002-1825-0097. Alternatively the environment
                            variable ORCID may be set.
      --full-name CWL_FULL_NAME
                            Record full name of user as part of provenance, e.g.
                            Josiah Carberry. You may need to use shell quotes to
                            preserve spaces. Alternatively the environment
                            variable CWL_FULL_NAME may be set.



```python

```
