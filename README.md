### Περιγραφή του Κώδικα

Ο παραπάνω κώδικας είναι ένα Bash script που προσομοιώνει τη λειτουργία ενός συστήματος επεξεργασίας παραγγελιών με τους παρακάτω βασικούς στόχους:

1. **Διαχείριση Καταλόγου Προϊόντων:**
   - Δημιουργία ενός καταλόγου με 20 προϊόντα, όπου κάθε προϊόν έχει:
     - Περιγραφή (π.χ., `Item_0`).
     - Τιμή (τυχαία τιμή μεταξύ 1 και 20).
     - Απόθεμα (σταθερό σε 2 μονάδες).
   - Ο κατάλογος αποθηκεύεται σε έναν συσχετιστικό πίνακα (`product_catalog`).

2. **Πελάτες και Παραγγελίες:**
   - Πέντε πελάτες προσομοιώνονται, καθένας από τους οποίους εκτελεί 10 παραγγελίες.
   - Οι πελάτες επικοινωνούν με τον server μέσω ονοματοδοτημένων σωλήνων (pipes).

3. **Επεξεργασία Παραγγελιών:**
   - Ο server:
     - Διαβάζει την παραγγελία του πελάτη.
     - Ελέγχει τη διαθεσιμότητα του προϊόντος.
     - Ενημερώνει το απόθεμα, εάν είναι διαθέσιμο.
     - Επιστρέφει αποτέλεσμα στον πελάτη (επιτυχία ή αποτυχία).
   - Στατιστικά για κάθε προϊόν καταγράφονται (π.χ., αριθμός αιτήσεων, πωλήσεις, αποτυχίες).

4. **Αναφορές και Στατιστικά:**
   - Μετά την ολοκλήρωση των παραγγελιών, δημιουργείται μια αναφορά που περιλαμβάνει:
     - Τον αριθμό αιτήσεων, πωλήσεων και αποτυχιών για κάθε προϊόν.
     - Λίστα πελατών που απέτυχαν να παραγγείλουν συγκεκριμένα προϊόντα.
     - Συνολικά στατιστικά, όπως ο συνολικός αριθμός παραγγελιών, επιτυχών και αποτυχιών.
     - Το συνολικό εισόδημα από τις πωλήσεις.

### Κύριες Δομές και Λειτουργίες

#### 1. **Κατάλογος Προϊόντων**
Ο κατάλογος αποθηκεύεται σε έναν συσχετιστικό πίνακα `product_catalog`. Κάθε εγγραφή περιέχει:
- Περιγραφή.
- Τιμή.
- Απόθεμα.

#### 2. **Παραγγελίες Πελατών**
Οι πελάτες επικοινωνούν μέσω των pipes `pipe_to_server_from_` και `pipe_from_server_to_`. Κάθε πελάτης:
- Στέλνει το ID ενός προϊόντος στο server.
- Λαμβάνει πίσω το αποτέλεσμα της παραγγελίας.

#### 3. **Server**
Ο server:
- Διαχειρίζεται τις αιτήσεις παραγγελιών μέσω της συνάρτησης `handle_order`.
- Ελέγχει τη διαθεσιμότητα του προϊόντος και ενημερώνει τα στατιστικά (`product_stats`).

#### 4. **Αναφορά**
Η αναφορά περιλαμβάνει:
- Αναλυτικά στατιστικά για κάθε προϊόν.
- Συνολικά στατιστικά για όλες τις παραγγελίες.
- Εσόδα ανά πελάτη.



Το αρχείο Makefile διαχειρίζεται την εκτέλεση και τη συντήρηση του script eshop.sh. Συνοπτικά:

Ορισμός Εκτελέσιμου:
Δημιουργεί ένα εκτελέσιμο με όνομα order_management συνδέοντάς το συμβολικά με το αρχικό script eshop.sh.

Κανόνες:

all: Δημιουργεί το εκτελέσιμο order_management.
clean: Διαγράφει το εκτελέσιμο και τα προσωρινά αρχεία.
rebuild: Καθαρίζει και δημιουργεί εκ νέου το εκτελέσιμο.
help: Παρέχει πληροφορίες για τη χρήση του Makefile.
Λεπτομέρειες Υλοποίησης:

Το script eshop.sh γίνεται εκτελέσιμο με την εντολή chmod +x.
Χρησιμοποιείται η εντολή ln -sf για τη δημιουργία συμβολικού συνδέσμου προς το αρχείο script.
Σήμανση .PHONY:
Διασφαλίζει ότι οι στόχοι όπως all, clean, rebuild, και help δεν θα συγκρουστούν με αρχεία ή φακέλους που ίσως έχουν το ίδιο όνομα.



Οσον αφορα την συναρτηση:
Το παραπάνω τμήμα κώδικα φαίνεται να είναι μέρος ενός σεναρίου Bash (shell script) και συγκεκριμένα ορισμός μιας συνάρτησης με το όνομα handle_order.

Ανάλυση του Κώδικα:
handle_order(): Αυτό είναι το όνομα της συνάρτησης που ορίζεται. Δεν παίρνει άλλες παραμέτρους στην αρχή, αλλά καθορίζονται δύο μεταβλητές μέσα στο σώμα της.

local item_id=$1: Αυτή η γραμμή ορίζει μια τοπική μεταβλητή item_id και της αναθέτει την τιμή του πρώτου ορίσματος που δίδεται στη συνάρτηση όταν καλείται ($1). Το $1 είναι η πρώτη παράμετρος που παρέχεται στην συνάρτηση κατά την κλήση της.

local client_id=$2: Παρόμοια με την προηγούμενη γραμμή, αυτή η γραμμή ορίζει μια τοπική μεταβλητή client_id και της αναθέτει την τιμή του δεύτερου ορίσματος που δίδεται στη συνάρτηση κατά την κλήση της ($2).

Τι κάνει η συνάρτηση:
Η συνάρτηση handle_order δεν εκτελεί καμία ενέργεια στο παρόν τμήμα του κώδικα, καθώς περιορίζεται μόνο στην ανάθεση τιμών στις τοπικές μεταβλητές item_id και client_id. Αυτό μπορεί να σημαίνει ότι η συνάρτηση προορίζεται για να χειριστεί μια παραγγελία, όπου item_id αντιστοιχεί στον μοναδικό αριθμό του προϊόντος και client_id στον αριθμό του πελάτη, αλλά προς το παρόν δεν φαίνεται να γίνεται κάποια περαιτέρω επεξεργασία ή επιστροφή αποτελέσματος.

Στην ουσία, αυτή η συνάρτηση πιθανώς να αναμένεται να κάνει κάτι περαιτέρω με αυτές τις μεταβλητές (όπως αποθήκευση της παραγγελίας ή επικοινωνία με βάση δεδομένων), αλλά για την ώρα εκτελεί μόνο τη διαδικασία αποθήκευσης των παραμέτρων σε τοπικές μεταβλητές.
