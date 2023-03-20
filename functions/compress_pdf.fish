function compress_pdf
    argparse --min-args=1 --max-args=1 -- $argv
    set -l input_file $argv[1]

    if ! string match --regex '\.pdf$' $input_file
        echo 'Error: Filename does not end with `.pdf`' >&2
        return 1
    end
    
    set -l output_file (string replace  --regex '\.pdf$' '_compressed.pdf' $filename)
    gs -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -o $output_file $input_file
end
