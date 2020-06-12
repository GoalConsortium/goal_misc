## WDL script -> DNAnexus workflow
Very simple WDL script, can be compiled using dxWDL to produce a DNAnexus workflow that is uable using the web or command line interface.

#### OVERVIEW OF WORKFLOW
Uses a docker image for the trim_galore tool from the goal consortium repo (https://hub.docker.com/orgs/goalconsortium/repositories) to trim fastq files.

#### FILES
``myWorkflow_modified.wdl :``Workflow file with all instructions to carry out a simple trim. <br/>
``myWorkflow_modified.json :``Points to files within the DNAnexus project. In this example, a set of reads (R1 and R2) within the folder brandi_trim_test are to be trimmed. json entries that specifiy items within the DNAnexus project are formatted as such: <br/>
``dx:///[DIRECTORY] ``<br/>
where DIRECTORY is a dir within the dx project, and "dx://" is a required preface.

#### PUSHING WDL TO DNANEXUS
``dxWDL.jar`` is a java package that will push wdl workflows to DNAnexus applets for use via command line or web interface. In this example, we push the example WDL workflow ``myWorkflow_modified.wdl`` to the DNAnexus platform using the command line. <br/>
1. Download dxWDL, here we use dxWDL-v1.47.2.jar from: https://github.com/dnanexus/dxWDL/releases <br/>
2. Login to DNAnexus using dx-toolkit <br/>
3. Either make a link to the downloaded ``dxWDL.jar`` or move to the same directory as the ``.wdl``
4. Push the workflow to your project: <br/>
``java -jar dxWDL-v1.47.2.jar compile myWorkflow_modified.wdl -project [PROJECT] -inputs myWorkflow_modified.json`` <br/>
where PROJECT is your dnanexus project. This will push the workflow to DNAnexus along with the applet for "brandi_trim." Thesea items are viewable via the web interface. Additionally, the compilation will produce another json file ``myWorkflow_modified.dx.json`` which can be used with dnanexus. 
##### TO MAKE AN UPDATE TO YOUR WDL FILE
As far as I can tell at this point, to change your workflow, re-compile using the -force option. This is contrary to statements here https://github.com/dnanexus/dxWDL/blob/master/doc/ExpertOptions.md#recompilation but I found that the -force option will for sure push your edits to DNAnexus.

#### RUN YOUR WORKFLOW
##### COMMAND LINE
The workflow in the wdl script is defined as ``brandi_trim``. To run this workflow together with items specified by the json file: <br/>
``dx run brandi_trim -f myWorkflow_modified.dx.json`` <br\>
From here, you can monitor the job via the web interface. Addtionally, you will get an email with a success / error message.

##### WEB INTERFACE
By compiling this workflow with dxWDL, you have created a workflow together with 2 applets, the main one being do_trim (not sure what the others are for). Click on the workflow "brandi_trim," specifiy the files for R1 and R2, and run the workflow
