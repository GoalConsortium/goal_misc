version 1.0

workflow brandi_trim {
    input {
        File fastq1_gz
        File fastq2_gz
    }

    call do_trim {
        input:
        fastq1_gz=fastq1_gz,
        fastq2_gz=fastq2_gz
    }

    output {
        Array[File] trimmed_reads = do_trim.fq_val
        Array[File] trimmed_report = do_trim.report
    }
}

task do_trim {
    input {
        String docker_image = "docker.io/goalconsortium/trim_galore:0.5.9"
        File fastq1_gz
        File fastq2_gz
    }

    command <<<
    trim_galore --paired -q 25 --illumina --gzip --length 35 "~{fastq1_gz}" "~{fastq2_gz}"
    >>>

    runtime {
        docker: "${docker_image}"
    }

    output {
        Array[File] fq_val = glob("*.fq.gz")
        Array[File] report = glob("*_trimming_report.txt")
    }
}
