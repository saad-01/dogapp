import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../models/dog_model.dart';
import '../utils/strings.dart';
import '../utils/utils.dart';
import 'services/storage_services.dart';

class AddDogModel extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final nameController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final microchipNumberController = TextEditingController().obs;

  final nameFocusNode = FocusNode().obs;
  final weightFocusNode = FocusNode().obs;
  final dateFocusNode = FocusNode().obs;
  final microchipNumberFocusNode = FocusNode().obs;

  final RxString photoUrl = ''.obs;
  final RxString breed = ''.obs;
  final RxString gender = ''.obs;
  final RxString neutered = ''.obs;
  final RxBool passwordVisible = true.obs;
  RxBool loading = false.obs;

  RxList<Color> selectedColors = <Color>[].obs;

  DateTime? _selectedDate;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  RxBool imageFlag = false.obs;

  void selectImage() async {
    final XFile? im = await _picker.pickImage(source: ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    image = im;
    imageFlag.value = true;
    update();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      dateController.value.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  void addColor(Color color) {
    selectedColors.add(color);
  }

  void removeColor(int index) {
    selectedColors.removeAt(index);
  }

  Future<String> createDog() async {
    List<String> colorHexList =
        selectedColors.map((color) => color.value.toRadixString(16)).toList();
    SharedPref pref = SharedPref();
    String? uid = await pref.getUidFromSharedPreferences();
    String res = await addDog(
        name: nameController.value.text,
        date: dateController.value.text,
        weight: weightController.value.text,
        breed: breed.value,
        microChipNumber: microchipNumberController.value.text,
        gender: gender.value,
        neutered: neutered.value,
        colors: colorHexList,
        uid: uid!,
        file: image!);
    if (res == "success") {
      Get.back();
      Utils.snackBar(AppStrings.success, AppStrings.dogAdded);
      return res;
    } else {
      // show the error
      Utils.snackBar(AppStrings.error, res);
      return res;
    }
  }

  Future<String> addDog({
    required String name,
    required String date,
    required String weight,
    required String breed,
    required String microChipNumber,
    required String gender,
    required String neutered,
    required List<String> colors,
    required String uid,
    required XFile file,
  }) async {
    String res = "Some error Occurred";
    try {
      String photoUrl = await StorageMethods()
          .uploadImageToStorage('dogProfilePics', file, false);
      if (name.isNotEmpty ||
          microChipNumber.isNotEmpty ||
          weight.isNotEmpty ||
          date.isNotEmpty ||
          gender.isNotEmpty ||
          neutered.isNotEmpty ||
          breed.isNotEmpty ||
          colors.isNotEmpty ||
          photoUrl == '') {
        String dogId = const Uuid().v1();

        DogModel dog = DogModel(
            name: name,
            uid: uid,
            photoUrl: photoUrl,
            weight: weight,
            date: date,
            microchipNumber: microChipNumber,
            breed: breed,
            colors: jsonEncode(colors),
            neutered: neutered,
            gender: gender,
            dogId: dogId);

        // adding user in our database
        await _firestore.collection("dogs").doc(dogId).set(dog.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  final List<String> dogBreeds = [
    'Affenpinscher',
    'Afghan Hound',
    'Airedale Terriers',
    'Akita Inu',
    'Alano Espanol',
    'Alaskan malamute',
    'Alpine Dachsbracke',
    'Old Danish pointer',
    'Old German Shepherd Dog',
    'American Bulldog',
    'American Foxhound',
    'American Pit Bull Terrier',
    'American Staffordshire Terrier',
    'American Water Spaniel',
    'American Cocker Spaniel',
    'Appenzell Mountain dog',
    'Ariege Pointing Dog',
    'Ariegeois',
    'Atlas mountain dog',
    'Aussiedoodle',
    'Australian Cattle Dog',
    'Australian Kelpie',
    'Australian Shepherd',
    'Australian Silky Terrier',
    'Australian terriers',
    'Azawakh',
    'Barak',
    'Borzoi',
    'Basenji',
    'Basset Artesia Normand',
    'Basset Bleu de Gascogne',
    'Basset Fauve de Bretagne',
    'Basset Hound',
    'Bavarian Mountain Hound',
    'Beagle',
    'Beagle Harrier',
    'Bearded Collie',
    'Beauceron',
    'Bedlington Terriers',
    'Belgian Griffon',
    'Bergamasco Shepherd Dog',
    'Berger Blanc Suisse',
    'Berger Picard',
    'Bernese Mountain Dog',
    'Saint Bernard',
    'Bichon Frize',
    'Billy',
    'Bloodhound',
    'Bobtail',
    'Bohemian rough beard',
    'Bolognese',
    'Bolonka Tswetna',
    'Dogue de Bordeaux',
    'Border collie',
    'Border terriers',
    'Boston terriers',
    'Bouvier des Ardennes',
    'Bouvier des Flandres',
    'boxer',
    'Brabant Griffon',
    'Braque du Bourbonnais',
    'Brandlbracke',
    "Braque d'Auvergne",
    'Braque Saint Germain',
    'Brazilian terrier',
    'Briard',
    'Briquet Griffon Vendeen',
    'Broholmer',
    'bullmastiff',
    'Bull Terrier',
    'Ca de Bou',
    'Cairn terriers',
    'Cane Corso Italiano',
    'Cao da Serra da Estrela',
    'Cao de Castro Laboreiro',
    'Cao Fila de Sao Miguel',
    'Carpatin',
    'Cavalier King Charles Spaniel',
    'Cavapoo',
    'Chesapeake Bay Retrievers',
    "Chien d'Artois",
    'Chihuahuas',
    'Chinese crested dog',
    'Chortaj',
    'Chow Chow',
    "Cirneco dell'Etna",
    'Clumber Spaniels',
    'Cockapoo',
    'collie',
    'Coonhound',
    'Canaan dog',
    'Coton de Tulear',
    'Curly Coated Retriever',
    'Dachshund',
    'Dalmatian',
    'Dandie Dinmont Terrier',
    'Deerhound',
    'German Wirehaired Pointer',
    'German Shorthaired Pointer',
    'German Longhair',
    'German Stichelhaar',
    'German Hound',
    'German Mastiff',
    'German hunting terrier',
    'German Pinscher',
    'German shepherd dog',
    'German Quail Dog',
    'Do Khyi',
    'Doberman',
    'Dogo Argentino',
    'Dogo Canario / Canary mastiff',
    'Wirehaired Fox Terrier',
    'Drentse Patrijshond',
    'Drever (Swedish Dachsbracke)',
    'English bulldog',
    'English cocker spaniel',
    'English Foxhound',
    'English Setters',
    'English Springer Spaniel',
    'English Toy Terrier',
    'Entlebuch Mountain Dog',
    'Epagneul Bleu de Picardie',
    'Epagneul Breton',
    'Coton de Tulear',
    'Epagneul de Pont-Audemer',
    'Epagneul Francais',
    'Epagneul Picard',
    'Eurasians',
    'Field Spaniels',
    'Fila Brasileiro',
    'Finnish Lapphund',
    'Finnish Hound',
    'Finnish Spitz',
    'Flat Coated Retriever',
    'Flatdoodle',
    'French bulldog',
    'French Hound',
    'French pointer',
    'French water dog',
    'Frenchie Pug',
    'Friesian water dog',
    'Gascon Saintongeois',
    'Smooth-haired Fox Terrier',
    'Golden retriever',
    'Goldendoodle',
    'Gordon Setter',
    'Grand Anglo Francais',
    'Grand Basset Griffon Vendeen',
    'Grand Bleu de Gascogne',
    'Lapland reindeer dog',
    'Stabyhoun',
    'Greyhound',
    'Greek Hound',
    'Griffon bleu de Gascogne',
    'Griffon Fauve de Bretagne',
    'Griffon Korthals',
    'Griffon Nivernais',
    'Groenendael',
    'Greenland Dog',
    'Large Münsterländer',
    'Greater Swiss Mountain Dog',
    'Great Spitz',
    'Haldenstøver',
    'Hamiltonstövare',
    'Hanoverian Bloodhound',
    'Harrier',
    'Havanese',
    'Havapoo',
    'Hokkaido',
    'Dutch Shepherd',
    'Hollandse Smoushond',
    'Hovawart',
    'Hygen dog',
    'Irish wolfhound',
    'Irish Glen of Imaal Terrier',
    'Irish setter',
    'Irish Soft Coated Wheaten Terrier',
    'Irish terriers',
    'Irish Water Spaniel',
    'Icelandic dog',
    'Istrian Hound',
    'Istrian Hound (wirehaired)',
    'Italian Hound (Shorthair)',
    'Italian wind chime',
    'Jack Russell Terriers',
    'Jämthund',
    'Japan Chinese',
    'Japanese Spitz',
    'Japanese terrier',
    'Kangal',
    'Karelian Bear Dog',
    'Karst Shepherd Dog',
    'Catalan Shepherd Dog',
    'Caucasian Shepherd Dog',
    'Kerry Blue Terrier',
    'King Charles Spaniels',
    'Kishu',
    'Labrador retrievers',
    'Lakeland terriers',
    'Leonberger',
    'Lhasa Apso',
    'Long-haired dachshund',
    'Magyar Agar',
    'Hungarian Vizsla',
    'Malinois',
    'Mallorca Shepherd Dog',
    'Maltese',
    'Maltipoo',
    'Mastiff',
    'Maremma-Abruzzo Shepherd Dog',
    'Mastiff',
    'Neapolitan Mastiff',
    'Miniature American Shepherd',
    'Miniature Bull Terrier',
    'Mioritic',
    'Montenegrin Mountain Hound',
    'pug',
    'Mudi',
    'Muggin',
    'Dutch Kooikerhondje',
    'Newfoundland',
    'Norfolk Terriers',
    'Norrbottenspitz',
    'Norwegian Buhund',
    'Norwegian Elkhound',
    'Norwegian Lundehund',
    'Norwich Terriers',
    'Nova Scotia Duck Tolling Retriever',
    'Austrian Pinscher',
    'Otterhound',
    'Old english bulldog',
    'Papillon',
    'Xoloitzcuintle',
    'Berger des Pyrénées',
    'Chart Polski',
    'Mastín del Pirineo',
    'Parson Russell Terrier',
    'Pekinese',
    'Perdigueiro Português',
    'Perdiguero De Burgos',
    'Peruvian hairless dog',
    'Petit Chien Lion',
    'Pharaoh Hound',
    'Podengo Português',
    'Poitevin',
    'Polish Hound',
    'Polski Owczarek Nizinny',
    'Porcelain',
    'Portuguese Shepherd',
    'Portuguese water dog',
    'Posavski Gonic',
    'Prague Rattler',
    'poodle',
    'Pudelpointer',
    'Puggle',
    'Puli',
    'Pumi',
    'Great Pyrenees Mountain Dog',
    'Rafeiro Do Alentejo',
    'Wire-haired dachshund',
    'Rhodesian Ridgeback',
    'Giant Schnauzer',
    'rottweiler',
    'Russkiy Toy',
    'Saarloos Wolfhound',
    'Saluki',
    'Samoyed',
    'Šarplaninac',
    'Schillerstövare',
    'Schipperke',
    'schnoodle',
    'Swedish Lapphund',
    'Swedish Vallhund',
    'Swiss Hound',
    'Swiss Low Hound',
    'Scottish terriers',
    'Sealyham Terrier',
    'Serbian Hound',
    'Serbian Hound (Tricolor)',
    'Shar Pei',
    'Shetland Sheepdog',
    'Polski Owczarek Podhalanski',
    'Sabueso Español',
    'Shiba Inu',
    'Shih Poo',
    'Shih Tzu',
    'Shikoku',
    'Siberian Husky',
    'Skye terrier',
    'Sloughi',
    'Slovak tuvach',
    'Slovensky Kopov',
    'Slovakian rough beard',
    'Smalandsstövare',
    'Spanish Mastiff',
    'Spanish Greyhound/Galgo Espanol',
    'Spinone Italiano',
    'Staffordshire bull terrier',
    'Styrian rough-haired hound',
    'Sussex Spaniel',
    'Taiwan dog',
    'Tervueren',
    'Thai Ridgeback',
    'Tibetan Spaniel',
    'Tibet terrier',
    'Tyrolean Hound',
    'Tosa Inu',
    'Cesky Terrier',
    'Czechoslovakian wolfhound',
    'Hungarian Hound',
    'Weimaraner',
    'Welsh Corgi cardigan',
    'Pembroke Welsh Corgi',
    'Welsh Springer Spaniel',
    'Welsh terriers',
    'West Highland White Terrier',
    'Westphalian Dachsbracke',
    'Westiepoo',
    'Whippet',
    'Wolfspitz',
    'Yorkiepoo',
    'Yorkshire Terriers',
    'Central Asian Ovcharka',
    'Dwarf Griffon',
    'Miniature Pinscher',
    'Miniature Schnauzer',
    'Pomeranian',
    'Toy Poodle',
  ];
}
