# Makefile για το script order_management.sh

# Όνομα του εκτελέσιμου
EXECUTABLE = order_management

# Το αρχείο πηγαίου κώδικα
SOURCE = eshop.sh

# Κανόνας για την προεπιλεγμένη ενέργεια (π.χ., μετατροπή σε εκτελέσιμο)
all: $(EXECUTABLE)

# Δημιουργία εκτελέσιμου από το script
$(EXECUTABLE): $(SOURCE)
	@echo "Δημιουργία εκτελέσιμου από το script $(SOURCE)"
	@chmod +x $(SOURCE)
	@ln -sf $(SOURCE) $(EXECUTABLE)

# Καθαρισμός των εκτελέσιμων και προσωρινών αρχείων
clean:
	@echo "Καθαρισμός εκτελέσιμων και προσωρινών αρχείων..."
	@rm -f $(EXECUTABLE)

# Καθαρισμός και επανεκκίνηση
rebuild: clean all

# Εξήγηση χρήσης του Makefile
help:
	@echo "Makefile για το script order_management.sh"
	@echo "Κανόνες:"
	@echo "  all      - Δημιουργεί το εκτελέσιμο $(EXECUTABLE)"
	@echo "  clean    - Καθαρίζει το εκτελέσιμο και προσωρινά αρχεία"
	@echo "  rebuild  - Καθαρισμός και εκ νέου δημιουργία του εκτελέσιμου"
	@echo "  help     - Εμφάνιση αυτού του μηνύματος"

# Σήμανση για την αποφυγή σφαλμάτων από μη ύπαρξη στόχων
.PHONY: all clean rebuild help

