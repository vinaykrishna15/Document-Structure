# Document-Structure
Validating the structure of the document

Installing the needed tools:

ssh in your linux machine:
type:

sudo yum install epel-release

yum install pdfgrep

yum install unzip

Go to your docx2txt-1.4/ folder and type:

sudo make

By doing all these steps:
you can now use the validate script.

If you have problems running the validate script:
then you might have to change the line endings by typing:

sed -i -e 's/\r$//' validate.sh

and in you docx2txt-1.4 folder:

sed -i -e 's/\r$//' docx2txt.sh docx2txt.pl
