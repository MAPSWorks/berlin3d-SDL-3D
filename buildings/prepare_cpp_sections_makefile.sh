#!/bin/sh
mkdir -p cpp-sections
(
echo "# autogenerated from $0"
echo
echo "objs: cpps \\"
cd gml-sections
for section in *; do
  echo " s_${section}.o \\"
done
echo
echo

echo "%.o: %.cpp"
echo "\tg++ -std=c++11 -mcmodel=medium -I../../include -c \$<"
echo
echo

echo "cpps: \\"

for section in *; do
  echo " s_${section}.cpp \\"
done
echo
echo

for section in *; do
  echo "s_${section}.cpp: ../gml-sections/${section}"
  echo "\t../parse_gml_section.py ../gml-sections/${section}"
  echo
done


) > cpp-sections/Makefile

(
echo "// autogenerated from $0"
echo
echo "#pragma once"
echo
echo "#include <city.h>"
echo
cd gml-sections
for section in *; do
  echo "#include \"s_${section}.h\""
done
echo
echo
echo "static const DwellingData* all_sections[] = {"
for section in *; do
  echo "  &s_${section},"
done
echo "};"

) > cpp-sections/all_sections.h
