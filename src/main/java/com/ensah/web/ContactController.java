package com.ensah.web;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;
import com.ensah.bo.User;
import com.ensah.service.IContactService;
import com.ensah.service.IGroupeService;
import com.ensah.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

//@RequestMapping({"/t-contact","/"})
@Controller
public class ContactController {

    protected final Logger LOGGER = Logger.getLogger(getClass());

    @Autowired
    IContactService contactService;

    @Autowired
    IGroupeService groupeService;

    @Autowired
    IUserService userService;

    @GetMapping("/afficherFormContact")
    public String afficherFormContact(Model model) {

        model.addAttribute("contactModel", new Contact());

        return "contactForm";
    }

    @PostMapping("/ajouterContact")
    public String ajouterContact(@Valid @ModelAttribute("contactModel") Contact contact, BindingResult bindingResult,
                            ModelMap model) {


        if (bindingResult.hasErrors()) {
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        } else {
            try{
                contactService.creeContact(contact);
                groupeService.creeGroupeByContactNom(contact);
                model.addAttribute("infoMsg", "Contact ajouté avec succès");
            }catch (DataIntegrityViolationException ex){
                model.addAttribute("errorMsg", "Contact deja existe avec méme numero telephone(personnel)");
                LOGGER.error("Erreur de unique num tele" + ex.getMessage());
            }
        }

        return "contactForm";
    }

    @GetMapping("/afficherContacts")
    public String afficherContacts(ModelMap model) {

        model.addAttribute("listContacts",contactService.afficherContactsParOrdreNom());

        return "afficherContacts";
    }

    @GetMapping("/supprimerContact/{id}")
    public String supprimerContact(@PathVariable Long id) {

        Contact cnt = contactService.getContactById(id);
        groupeService.supprimerAffectation(cnt);
        contactService.supprimerContact(id);

        return "redirect:/afficherContacts";
    }

    @RequestMapping("/modifierContactForm/{id}")
    public String modifierContactForm(Model model,@PathVariable Long id) {

        Contact cnt = contactService.getContactById(id);
        model.addAttribute("contactModel", cnt);

        return "modifierContactForm";
    }

    @PostMapping("/modifierContact")
    public String modifierContact(@Valid @ModelAttribute("contactModel") Contact contact,
                                  BindingResult bindingResult, ModelMap model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        } else {
            try {
                contactService.modifierContact(contact);
                model.addAttribute("infoMsg", "Contact modifié avec succès");
            }catch (DataIntegrityViolationException ex){
                model.addAttribute("errorMsg", "Contact deja existe avec méme numero telephone(personnel)");
                LOGGER.error("Erreur de unique num tele" + ex.getMessage());
            }
        }

        return "modifierContactForm";
    }

    @RequestMapping("/affectationForm/{id}")
    public String affectationForm(Model model, @PathVariable Long id) {

        Contact cnt = contactService.getContactById(id);
        model.addAttribute("contactModel", cnt);
        model.addAttribute("listGroupes", groupeService.afficherGroupe());

        return "affectationForm";
    }

    @PostMapping("/ContactaffecterGroupe")
    public String ContactaffecterGroupe(@RequestParam("grpC") Long idGroupe,
                                     @RequestParam("idContact") Long idContact) {

        Contact cnt = contactService.getContactById(idContact);
        groupeService.ajouterAffectation(cnt,idGroupe);
        contactService.modifierContact(cnt);

        return "redirect:/afficherContacts";
    }

    @RequestMapping("/supprimerAffectation/{idContact}")
    public String supprimerAffectation(@PathVariable("idContact") Long idContact) {

        Contact cnt = contactService.getContactById(idContact);
        groupeService.supprimerAffectation(cnt);
        contactService.modifierContact(cnt);

        return "redirect:/afficherContacts";
    }

    @GetMapping("/rechercherContactParNom")
    public String rechercherContactParNom(Model model) {

        model.addAttribute("contactModel", new Contact());

        return "rechercherContactParNom";
    }

    @PostMapping("/NomContactRechercher")
    public String NomContactRechercher(@Valid @ModelAttribute("contactModel") Contact contact, BindingResult bindingResult,
                               ModelMap model) {

        if (bindingResult.hasFieldErrors("nom")){
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        } else {
            List<Contact> contactR = contactService.RechercheParNom(contact.getNom());
            if (contactR.isEmpty()) {
                model.addAttribute("errorMsg", "Aucun contact trouvé");
            } else {
                model.addAttribute("contactR",contactR);
                model.addAttribute("infoMsg", "Contact cherché");
            }
        }

        return "rechercherContactParNom";
    }

    @GetMapping("/rechercherContactParNum")
    public String rechercherContactParNum(Model model) {

        model.addAttribute("contactModel", new Contact());

        return "rechercherContactParNum";
    }

    @PostMapping("/NumContactRechercher")
    public String NumContactRechercher(ModelMap model, @RequestParam("telephone") String telephone) {

        if(telephone.matches("^(06|07)\\d{8}$")){
            Contact Rcontact=contactService.RechercheParNum(telephone);
            if(Rcontact!=null){
                model.addAttribute("contactR",Rcontact);
                model.addAttribute("infoMsg", "Contact cherché");
            }else {
                model.addAttribute("errorMsg", "Aucun contact trouvé");
            }
        }else{
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        }

        return "rechercherContactParNum";
    }

    @GetMapping({"/groupeForm"})
    public String groupeForm(Model model) {

        model.addAttribute("grpModel", new Groupe());

        return "groupeForm";
    }

    @PostMapping("/ajouterGroupe")
    public String ajouterGroupe(@Valid @ModelAttribute("grpModel") Groupe grp, BindingResult bindingResult,
                               ModelMap model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        } else {
            try {
                groupeService.creeGroupe(grp);
                model.addAttribute("infoMsg", "Groupe ajouté avec succès");
            }catch (DataIntegrityViolationException ex){
                model.addAttribute("errorMsg", "Groupe deja existe");
                LOGGER.error("Erreur de unique groupe" + ex.getMessage());
            }
        }

        return "groupeForm";
    }

    @GetMapping("/afficherGroupes")
    public String afficherGroupes(ModelMap model) {

        model.addAttribute("listGroupes",groupeService.afficherGroupe());

        return "afficherGroupes";
    }


    @GetMapping("/supprimerGroupe/{id}")
    public String supprimerGroupe(@PathVariable Long id) {

        Groupe grp=groupeService.getGroupeById(id);
        contactService.supprimerAffectationCnt(grp);
        groupeService.supprimerGroupe(id);

        return "redirect:/afficherGroupes";
    }

    @RequestMapping("/modifierGrpForm/{id}")
    public String modifierFormGrp(Model model,@PathVariable Long id) {

        Groupe grp = groupeService.getGroupeById(id);
        model.addAttribute("grpModel", grp);

        return "modifierGrpForm";
    }

    @PostMapping("/modifierGroupe")
    public String modifierGroupe(@Valid @ModelAttribute("grpModel") Groupe grp, BindingResult bindingResult,
                                  ModelMap model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        } else {
            try{
            groupeService.modifierGroupe(grp);
            model.addAttribute("infoMsg", "Groupe modifié avec succès");
            }catch (DataIntegrityViolationException ex){
                model.addAttribute("errorMsg", "Groupe deja existe");
                LOGGER.error("Erreur de unique groupe" + ex.getMessage());
            }
        }

        return "modifierGrpForm";
    }

    @GetMapping("/rechercherGroupe")
    public String rechercherGroupe(Model model) {

        model.addAttribute("grpModel", new Groupe());

        return "rechercherGroupe";
    }

    @PostMapping("/groupeRechercher")
    public String groupeRechercher(@Valid @ModelAttribute("grpModel") Groupe grp, BindingResult bindingResult,
                                   ModelMap model) {

        if (bindingResult.hasFieldErrors("nom")){
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        } else {
            List<Groupe> groupeR=groupeService.RechercheParNom(grp.getNom());
            if (groupeR.isEmpty()) {
                model.addAttribute("errorMsg", "Aucun groupe trouvé");
            } else {
                model.addAttribute("groupeR",groupeR);
                model.addAttribute("infoMsg", "Groupe cherché");
            }
        }

        return "rechercherGroupe";
    }

    @RequestMapping("/afficherContactsOfGroupe/{id}")
    public String afficherContactsOfGroupe(Model model,@PathVariable Long id) {

        Groupe grp = groupeService.getGroupeById(id);
        model.addAttribute("grpModel", grp);
        model.addAttribute("listContacts",grp.getContacts());

        return "afficherContactsOfGroupe";
    }


    @RequestMapping("/ContactsToAjouterGroupe/{id}")
    public String ContactsToAjouterGroupe(Model model,@PathVariable Long id) {

        Groupe grp=groupeService.getGroupeById(id);
        model.addAttribute("grpModel", grp);
        model.addAttribute("listContacts",contactService.afficherContactsParOrdreNom());

        return "ajouterContactsToGroupe";
    }

    @GetMapping("/ajouterContactsToGroupe/{id}/{idContact}")
    public String ajouterContactsToGroupe(@PathVariable Long idContact, @PathVariable Long id) {

        Groupe grp=groupeService.getGroupeById(id);
        contactService.ajouterContactsToGroupe(grp,idContact);
        groupeService.modifierGroupe(grp);

        return "redirect:/ContactsToAjouterGroupe/"+id;
    }

    @RequestMapping("/supprimerContactOfGroupe/{id}/{idContact}")
    public String supprimerContactOfGroupe(@PathVariable Long id, @PathVariable Long idContact) {

        Groupe grp = groupeService.getGroupeById(id);
        contactService.supprimerContactOfGroupe(grp,idContact);
        groupeService.modifierGroupe(grp);

        return "redirect:/afficherContactsOfGroupe/"+id;
    }

    @GetMapping({"/accueil","/"})
    public String Accueil(Model model) {

        model.addAttribute("nbrOfConatcts",contactService.getRowCount());
        model.addAttribute("nbrOfGroupes",groupeService.getRowCount());


        return "accueil";
    }

    @GetMapping ("/login")
    public String login(@RequestParam(name = "error", required = false) String error,
                        ModelMap model){

        if (error != null) {
            String errorMsg = "Numero telephone ou Mot de passe incorrecte";
            model.addAttribute("errorMsg", errorMsg);
        }

        return "login";
    }

    @GetMapping ("/inscrirptionForm")
    public String inscrirptionForm(ModelMap model){

        model.addAttribute("userModel", new User());

        return "inscrire";
    }

    @PostMapping ("/inscrirption")
    public String inscrire(@Valid @ModelAttribute("userModel") User user, BindingResult bindingResult,
                           ModelMap model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        } else {
            try{
                userService.creeUser(user);
                model.addAttribute("infoMsg", "Compte inscrit avec succès");
            }catch (DataIntegrityViolationException ex){
                model.addAttribute("errorMsg", "Compte deja existe avec méme numero telephone");
                LOGGER.error("Erreur de unique num tele" + ex.getMessage());
            }
        }

        return "inscrire";
    }

    @GetMapping ("/modifierUserForm")
    public String modifierUserForm(ModelMap model,Principal principal){

        String telephone = principal.getName();
        User user = userService.getUserByTele(telephone);
        model.addAttribute("userModel", user);

        return "userModification";
    }

    @PostMapping("/modifierUser")
    public String modifierUser(@Valid @ModelAttribute("userModel") User user,
                                  BindingResult bindingResult, ModelMap model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        } else {
            try {
                userService.modifierUser(user);
                model.addAttribute("infoMsg", "Profile modifié avec succès");
            }catch (DataIntegrityViolationException ex){
                model.addAttribute("errorMsg", "User deja existe avec méme numero telephone");
                LOGGER.error("Erreur de unique num tele" + ex.getMessage());
            }
        }

        return "userModification";
    }

    @GetMapping ("/MotDePasseForm")
    public String MotDePasseForm(){

        return "modifierMotDePasse";
    }

    @PostMapping("/modifierMotDePasse")
    public String modifierMotDePasse(ModelMap model,Principal principal,
                                     @RequestParam("OldMotDePasse") String OldMotDePasse
                                        , @RequestParam("NewMotDePasse") String NewMotDePasse) {

        if(OldMotDePasse!="" && NewMotDePasse!=""){
            try {
                String telephone = principal.getName();
                User user = userService.getUserByTele(telephone);
                userService.modifierUserMDP(user,OldMotDePasse,NewMotDePasse);
                model.addAttribute("infoMsg", "Mot de passe modifié avec succès");
            }catch (IllegalArgumentException ex){
                model.addAttribute("errorMsg", "Verifier votre ancien mdp");
                LOGGER.error("Erreur mdp" + ex.getMessage());
            }
        }else{
            model.addAttribute("errorMsg", "Les données sont invalides.");
            LOGGER.warn("Erreur de validation du formulaire");
        }

        return "modifierMotDePasse";
    }

}
