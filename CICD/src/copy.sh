#!/bin/bash

scp /home/gitlab-runner/builds/XTi6xG8s/0/students/DO6_CICD.ID_356283/carnaget_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat carnaget@10.10.0.2:/usr/local/bin/
scp /home/gitlab-runner/builds/XTi6xG8s/0/students/DO6_CICD.ID_356283/carnaget_student.21_school.ru/DO6_CICD-1/src/grep/s21_grep carnaget@10.10.0.2:/usr/local/bin/
ssh car@10.10.0.2 ls -lah /usr/local/bin