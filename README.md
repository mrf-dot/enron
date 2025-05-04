# Enron Data Parsing

A collection of AWK scripts for parsing through the Enron email corpus.

## Purpose

This project was created as part of the final project for my Data class. It allows you to get statistics such as the most frequent words  and phone number area codes from the corpus. In order to parse this data efficiently, the program takes advantage of the classic UNIX text processing program AWK to parse through more than 30 million lines of text.

## Obtaining the Data

In order to first run the program, you will need access to the Enron email corpus. Due to this file's size (over 1.3GB), it would be impossible to keep the entire file within this repository. Thankfully, [Kaggle](https://www.kaggle.com/) kindly hosts the file for us. In order to obtain a copy of the data, first clone the repository

```sh
git clone https://github.com/mrf-dot/enron
cd enron
```

Then, use the `curl` command to obtain a copy of the corpus from Kaggle's website.

```sh
curl -Lo emails.csv.zip 'https://www.kaggle.com/api/v1/datasets/download/wcukierski/enron-email-dataset'
```

Finally, unzip the file into the directory.

```sh
unzip emails.csv.zip
rm -f emails.csv.zip
```

## How to Run

Currently, there are two shell scripts in the directory. The first, `get-phone-numbers.sh`, allows you to see the top 10 area codes of phone numbers in the email corpus. The second, `get-word-frequency.sh`, allows you to see the top 10 words used in the corpus (excluding a, an, and the). These scripts can require a bit of computing power to run due to the size of the data set, so you may need to allow a few minutes for them to produce output. To run the phone number script, execute the following shell commands.

```
chmod +x get-phone-numbers.sh
./get-phone-numbers.sh
```

To run the word frequency script, execute these shell commands.

```
chmod +x get-word-frequency.sh
./get-word-frequency.sh
```

If you are running Mac or Linux (or any UNIX like OS), you should not need to install any extra software to get this working, as the project only uses standard UNIX utilities. If you are running a Windows Machine, you may need to use [WSL (Windows Subsystem for Linux)](https://learn.microsoft.com/en-us/windows/wsl/install) or a utility like [MSYS2](https://www.msys2.org/).
