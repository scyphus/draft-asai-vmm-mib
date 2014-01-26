TARGET = vmm-mib
OUTPUT_TXT_NAME = draft-ietf-opsawg-vmm-mib-00.txt
XML2RFC = xml2rfc
A2PS = a2ps
PS2PDF = ps2pdf
IDNITS = idnits
LC_ALL=C

.SUFFIXES: .txt .xml .ps .pdf

.xml.txt:
	$(XML2RFC) $<
.ps.pdf:
	$(PS2PDF) $<
.txt.ps:
	$(A2PS) $< -o $@

$(TARGET).txt: $(TARGET).xml

$(TARGET).pdf: $(TARGET).txt

$(OUTPUT_TXT_NAME): $(TARGET).txt
	cp $(TARGET).txt $(OUTPUT_TXT_NAME)

all: $(TARGET).txt
	cp $(TARGET).txt $(OUTPUT_TXT_NAME)

pdf: $(TARGET).pdf

validate: $(OUTPUT_TXT_NAME)
	$(IDNITS) $(OUTPUT_TXT_NAME)
#	$(IDNITS) --submitcheck

clean:
	@rm -f $(TARGET).pdf $(TARGET).ps $(TARGET).txt $(OUTPUT_TXT_NAME)
