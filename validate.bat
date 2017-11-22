@echo off
echo "-----"
echo "validating folders"
cd C:\Users\sameer.g.kumar\Document-Structure\Document\2017-11-06\Software Capacity/V1/
echo "-----"
IF EXIST Changelog.docx (
  echo "Changelog exists"
) ELSE (
echo "Changelog doesn't exist"
)
echo "-----"
IF EXIST Manual.docx (
  echo "Manual exists"
) ELSE (
echo "Manual doesn't exist"
)
echo "-----"
IF EXIST Runooks.docx (
  echo "Runbooks exists"
) ELSE (
echo "Runbooks doesn't exist"
)

