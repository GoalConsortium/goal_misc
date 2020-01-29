## WDL script -> DNAnexus workflow
Very simple WDL script, can be compiled using dxWDL to produce a DNAnexus workflow that is uable on the web interface or using the command line.

OVERVIEW OF WORKFLOW
uses trim_galore, docker image from the goal consortium repo (https://hub.docker.com/orgs/goalconsortium/repositories) to trim fastq files

## NOTES ON THE WDL SCRIPT


## PUSHING WDL TO DNANEXUS
version of dxWDL used: dxWDL-v1.41.jar downloaded here: https://github.com/dnanexus/dxWDL/releases
java -jar dxWDL-v1.41.jar compile myWorkflow_modified.wdl -project [PROJECT]
where PROJECT is your dnanexus project

## USAGE: DNAnexus interface
brandi_trim workflow
INPUT
Fastq files, specify "inputs" in the RUN "BRANDI_TRIM" AS ANALYSIS by clicking on workflow
OUTPUT
tirmmed reads : reads trimmed by trimmmomatic tool
trimmed report: details on the trimming, how many reads were trimmed, etc.

## USAGE: command line
