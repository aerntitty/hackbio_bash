#Print your name
echo "Nora"

#Create a folder titled your name
mkdir -p Nora

#Create another new directory titled biocomputing and change to that directory with one line of command
mkdir -p  biocomputing && cd biocomputing

#download the three files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gb

#move the fna file k

#Move the .fna file to the folder titled your name
mv *.fna ../Nora/
 
#Delete the duplicate gbk file
rm -i wildtype.gbk.1

#Confirm if the file is mutant or wild type (tatatata vs tata)
if grep -qi "tatatata" ../Nora/wildtype.fna; then
    echo "This is a MUTANT"
    # 8. If mutant, print all matching lines into a new file
    grep -i "tatatata" ../Nora/wildtype.fna > ../Nora/mutant_matches.fna
else
    echo "This is WILD TYPE"
fi


#count the number of lines ( excluding header ) in the gbk file
grep -A100000 ORIGIN wildtype.gbk | tail -n +2 | wc -l

#0. Print the sequence length of the .gbk file. (Use the LOCUS tag in the first line
head -n 1 wildtype.gbk | awk '{print $3}'

#Print the source organism of the .gbk file. (Use the SOURCE tag in the first line
grep -m 1 "^SOURCE" wildtype.gbk | awk '{$1=""; print $0}'

#List all the gene names of the .gbk file. Hint {grep '/gene='}
grep '/gene=' wildtype.gbk

#Clear your terminal space and print all commands used today
clear
history

#List the files in the 2 folders
ls ../Nora
ls .

#part 2

#Project 2: Installing Bioinformatics Software on the Terminal

# Activate your base conda environment
conda activate base

#Create a conda environment named funtools
conda create -n funtools
conda activate funtools

#Install Figlet using conda or apt-get
#5. Run figlet <your name>

sudo apt-get update
sudo apt-get install figlet -y

figlet "Nora Iyeh"

#install needed tools

# 6. Install bwa
conda install -c bioconda bwa -y

# 7. Install blast
conda install -c bioconda blast -y

# 8. Install samtools
conda install -c bioconda samtools -y

# 9. Install bedtools
conda install -c bioconda bedtools -y

# 10. Install spades.py
conda install -c bioconda spades -y

# 11. Install bcftools
conda install -c bioconda bcftools -y

# 12. Install fastp
conda install -c bioconda fastp -y

# 13. Install multiqc
conda install -c bioconda multiqc -y

s


#check versions 
bwa
samtools --version
blastn -version
bedtools --version
spades.py --version
bcftools --version
fastp --version
multiqc --version

