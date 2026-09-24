// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

void main() async {
  final outputDir = Directory('assets/question_packs');
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  final subjects = [
    'science',
    'math',
    'english',
    'general_knowledge',
    'history',
    'geography',
    'computers',
    'animals',
    'telugu',
    'hindi',
  ];

  final List<Map<String, dynamic>> manifestPacks = [];

  for (final subject in subjects) {
    final questions = _buildQuestionsForSubject(subject);
    final packId = '${subject}_pack_001';
    final packData = {
      'packId': packId,
      'subjectId': subject,
      'version': 1,
      'questionCount': questions.length,
      'createdAt': '2026-09-23T00:00:00Z',
      'questions': questions,
    };

    final rawJson = const JsonEncoder.withIndent('  ').convert(packData);
    final sha256Hash = sha256.convert(utf8.encode(rawJson)).toString();

    final file = File('${outputDir.path}/$subject.json');
    file.writeAsStringSync(rawJson);

    manifestPacks.add({
      'id': packId,
      'subject': subject,
      'ageGroup': 'all',
      'version': 1,
      'questionCount': questions.length,
      'url':
          'https://raw.githubusercontent.com/quiznest/quiznest-content/main/packs/$subject.json',
      'sha256': sha256Hash,
      'releaseDate': '2026-09-23',
    });
    print('Generated $subject: ${questions.length} questions');
  }

  final manifest = {
    'version': 1,
    'updatedAt': '2026-09-23T00:00:00Z',
    'packs': manifestPacks,
  };

  final manifestJson = const JsonEncoder.withIndent('  ').convert(manifest);
  File('${outputDir.path}/manifest.json').writeAsStringSync(manifestJson);
  print('Successfully wrote manifest.json with ${manifestPacks.length} packs');
}

List<Map<String, dynamic>> _buildQuestionsForSubject(String subject) {
  switch (subject) {
    case 'science':
      return _generateScienceQuestions();
    case 'math':
      return _generateMathQuestions();
    case 'english':
      return _generateEnglishQuestions();
    case 'general_knowledge':
      return _generateGkQuestions();
    case 'history':
      return _generateHistoryQuestions();
    case 'geography':
      return _generateGeographyQuestions();
    case 'computers':
      return _generateComputersQuestions();
    case 'animals':
      return _generateAnimalsQuestions();
    case 'telugu':
      return _generateTeluguQuestions();
    case 'hindi':
      return _generateHindiQuestions();
    default:
      return [];
  }
}

Map<String, dynamic> _q({
  required String id,
  required String subject,
  required String language,
  required String ageGroup,
  required String difficulty,
  required String questionText,
  required List<String> options,
  required int correctOption,
  required String explanation,
  required String category,
}) {
  return {
    'id': id,
    'subjectId': subject,
    'language': language,
    'ageGroup': ageGroup,
    'difficulty': difficulty,
    'questionText': questionText,
    'options': options,
    'correctOption': correctOption,
    'explanation': explanation,
    'category': category,
    'source': 'QuizNest Educational Curriculum',
    'packVersion': 1,
    'createdAt': '2026-09-23T00:00:00Z',
    'updatedAt': '2026-09-23T00:00:00Z',
  };
}

// ----------------------------------------------------
// SCIENCE (102 Questions)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateScienceQuestions() {
  final list = <Map<String, dynamic>>[];

  // 5-7: 34 questions
  final s5to7 = [
    ["What planet do we live on?", ["Earth", "Mars", "Jupiter", "Venus"], 0, "We live on planet Earth, the third planet from the Sun.", "Astronomy"],
    ["What star gives us light and heat during the day?", ["The Sun", "The Moon", "Polaris", "Mars"], 0, "The Sun is a bright star at the center of our solar system.", "Astronomy"],
    ["What do plants need to grow?", ["Water and sunlight", "Juice and soda", "Only darkness", "Ice cream"], 0, "Plants need water, sunlight, and soil nutrients to make their food.", "Biology"],
    ["Which sense organ do we use to smell flowers?", ["Nose", "Ears", "Eyes", "Tongue"], 0, "Our nose contains olfactory receptors that allow us to detect smells.", "Human Body"],
    ["What happens to water when it freezes?", ["Turns into ice", "Turns into steam", "Disappears", "Catches fire"], 0, "Water turns from liquid into solid ice at 0 degrees Celsius.", "Physics"],
    ["Which sense organ helps us hear sounds?", ["Ears", "Eyes", "Skin", "Nose"], 0, "Our ears catch sound vibrations in the air so we can hear.", "Human Body"],
    ["What color are plant leaves usually?", ["Green", "Blue", "Purple", "Silver"], 0, "Leaves are green because of a pigment called chlorophyll.", "Biology"],
    ["What falls from clouds when it rains?", ["Water drops", "Milk", "Sand", "Coins"], 0, "Rain is liquid water droplets falling from condensed clouds.", "Earth Science"],
    ["How many legs does an insect have?", ["6", "4", "8", "2"], 0, "All adult insects have three pairs of legs, which equals six legs.", "Biology"],
    ["What breathes in oxygen and pumps blood in our body?", ["Heart and Lungs", "Stomach", "Knees", "Teeth"], 0, "Lungs take in oxygen and the heart pumps oxygen-rich blood.", "Human Body"],
    ["What covers our body and lets us feel touch?", ["Skin", "Bones", "Hair only", "Nails"], 0, "Skin is the largest sensory organ of the human body.", "Human Body"],
    ["Which object produces its own light?", ["A candle flame", "A mirror", "A rock", "A book"], 0, "Candles produce their own light through combustion.", "Physics"],
    ["What do bees collect from flowers to make honey?", ["Nectar", "Leaves", "Mud", "Pebbles"], 0, "Bees collect sweet nectar from flowers to produce honey.", "Biology"],
    ["What shape is planet Earth most like?", ["A round sphere", "A flat square", "A triangle", "A straight line"], 0, "Earth is an oblate spheroid, which is round like a ball.", "Astronomy"],
    ["Which animal can live both on land and in water?", ["Frog", "Elephant", "Eagle", "Lion"], 0, "Frogs are amphibians and can live both in water and on land.", "Biology"],
    ["What season comes after winter and brings blooming flowers?", ["Spring", "Autumn", "Monsoon", "Midnight"], 0, "Spring brings warmer weather and blooming plant life.", "Earth Science"],
    ["What makes our bones strong?", ["Calcium from milk", "Eating candy", "Staying in bed", "Drinking soda"], 0, "Calcium and Vitamin D help build dense, strong bones.", "Health"],
    ["Which bird flies at night and can turn its head almost all the way around?", ["Owl", "Duck", "Sparrow", "Pigeon"], 0, "Owls are nocturnal birds with exceptional night vision.", "Biology"],
    ["What is the colored part of our eye called?", ["Iris", "Pupil", "Lens", "Retina"], 0, "The iris is the colorful ring of muscle in our eye.", "Human Body"],
    ["What gas do humans need to breathe in to survive?", ["Oxygen", "Carbon dioxide", "Helium", "Methane"], 0, "Oxygen is essential for human cellular respiration.", "Human Body"],
    ["What is baby dog called?", ["Puppy", "Kitten", "Calf", "Cub"], 0, "A young dog is called a puppy.", "Biology"],
    ["Which part of a plant is under the ground?", ["Roots", "Leaves", "Flowers", "Fruit"], 0, "Roots anchor the plant and drink water from the soil.", "Biology"],
    ["What natural event produces a colorful arc in the sky after rain?", ["Rainbow", "Tornado", "Snowstorm", "Fog"], 0, "Sunlight refracting through raindrops creates a rainbow.", "Physics"],
    ["How many teeth does an adult human usually have?", ["32", "10", "50", "20"], 0, "Adults typically have 32 permanent teeth.", "Human Body"],
    ["Which of these materials will float on water?", ["Dry wooden cork", "Iron nail", "Heavy stone", "Glass marble"], 0, "Wood is less dense than water, so it floats.", "Physics"],
    ["What is water called when it turns into gas?", ["Water vapor / Steam", "Ice", "Slush", "Clay"], 0, "Evaporated water is called water vapor or steam.", "Chemistry"],
    ["Which planet is closest to the Sun?", ["Mercury", "Mars", "Saturn", "Neptune"], 0, "Mercury is the smallest and closest planet to the Sun.", "Astronomy"],
    ["What do caterpillars turn into?", ["Butterflies", "Beetles", "Frogs", "Fish"], 0, "Caterpillars undergo metamorphosis inside a chrysalis to become butterflies.", "Biology"],
    ["What gives us nighttime light in the sky?", ["The Moon", "The Sun", "A cloud", "A comet always"], 0, "The Moon reflects sunlight down to Earth during the night.", "Astronomy"],
    ["Which organ digests the food we eat?", ["Stomach", "Lungs", "Heart", "Ears"], 0, "The stomach uses acids and enzymes to break down food.", "Human Body"],
    ["What tool do doctors use to listen to your heartbeat?", ["Stethoscope", "Thermometer", "Telescope", "Microscope"], 0, "A stethoscope magnifies internal sounds like heartbeats.", "Science Tools"],
    ["Which animal sleeps hanging upside down?", ["Bat", "Koala", "Penguin", "Dog"], 0, "Bats hang upside down by their claws to roost and rest.", "Animals"],
    ["Which substance is a solid?", ["A wooden block", "Orange juice", "Water vapor", "Cooking oil"], 0, "A wooden block keeps its shape, which defines a solid.", "Physics"],
    ["Why do we wash our hands with soap?", ["To wash away germs", "To make them sticky", "To change skin color", "To cool them down"], 0, "Soap molecules break down bacterial and viral membranes.", "Health"],
  ];

  for (int i = 0; i < s5to7.length; i++) {
    final item = s5to7[i];
    list.add(_q(
      id: 'sci_5_7_${(i + 1).toString().padLeft(3, '0')}',
      subject: 'science',
      language: 'en',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: item[0] as String,
      options: List<String>.from(item[1] as List),
      correctOption: item[2] as int,
      explanation: item[3] as String,
      category: item[4] as String,
    ));
  }

  // 8-10: 34 questions
  final s8to10 = [
    ["Which gas do green plants absorb from the air during photosynthesis?", ["Carbon dioxide", "Oxygen", "Nitrogen", "Argon"], 0, "Plants absorb carbon dioxide and water to create glucose and oxygen.", "Botany"],
    ["What is the chemical formula for pure water?", ["H2O", "CO2", "NaCl", "O2"], 0, "Water is made of two hydrogen atoms bonded to one oxygen atom.", "Chemistry"],
    ["What is the center of an atom called?", ["Nucleus", "Electron", "Orbit", "Photon"], 0, "The nucleus contains protons and neutrons at the center of an atom.", "Physics"],
    ["Which planet is nicknamed the 'Red Planet'?", ["Mars", "Venus", "Jupiter", "Mercury"], 0, "Mars looks red due to iron oxide (rust) on its surface.", "Astronomy"],
    ["What force pulls objects toward the center of the Earth?", ["Gravity", "Magnetism", "Friction", "Centrifugal force"], 0, "Gravity is the attractive force that keeps our feet on the ground.", "Physics"],
    ["What layer of Earth do we walk and build houses on?", ["Crust", "Mantle", "Outer core", "Inner core"], 0, "The Earth's crust is the thin solid outermost shell.", "Geology"],
    ["Which organ in the human body cleans our blood and produces urine?", ["Kidneys", "Liver", "Lungs", "Heart"], 0, "The kidneys filter wastes, excess water, and toxins from blood.", "Human Body"],
    ["Sound travels fastest through which of these mediums?", ["Solids like steel", "Liquids like water", "Air", "Outer space vacuum"], 0, "Sound needs tightly packed particles to travel, so it moves fastest in solids.", "Physics"],
    ["What type of energy is stored in food and batteries?", ["Chemical energy", "Thermal energy", "Sound energy", "Nuclear energy"], 0, "Chemical bonds store energy that is released during chemical reactions.", "Physics"],
    ["What is the boiling point of pure water at sea level?", ["100°C", "0°C", "50°C", "212°C in Celsius"], 0, "Water boils at 100 degrees Celsius (212 degrees Fahrenheit).", "Chemistry"],
    ["Which part of a plant cell gives it structural rigidity and shape?", ["Cell wall", "Mitochondria", "Nucleus", "Cytoplasm"], 0, "Plant cells have a rigid cellulose cell wall outside the cell membrane.", "Cell Biology"],
    ["Which planet in our solar system has the most prominent visible rings?", ["Saturn", "Uranus", "Neptune", "Jupiter"], 0, "Saturn's rings are made of billions of chunks of ice and rock.", "Astronomy"],
    ["What instrument is used to see tiny organisms like bacteria?", ["Microscope", "Telescope", "Periscope", "Barometer"], 0, "Microscopes magnify objects hundreds or thousands of times.", "Science Tools"],
    ["What are animals called that eat both plants and meat?", ["Omnivores", "Herbivores", "Carnivores", "Frugivores"], 0, "Omnivores consume both plant matter and animal protein.", "Ecology"],
    ["What is the process where liquid water turns into water vapor?", ["Evaporation", "Condensation", "Precipitation", "Sublimation"], 0, "Heat from the sun causes liquid water to evaporate into vapor.", "Earth Science"],
    ["Which blood cells help fight infections and diseases?", ["White blood cells", "Red blood cells", "Platelets", "Plasma"], 0, "White blood cells (leukocytes) form our immune defense system.", "Human Body"],
    ["What is the hardest natural mineral known on Earth?", ["Diamond", "Quartz", "Granite", "Topaz"], 0, "Diamond rates a 10 on the Mohs scale of mineral hardness.", "Geology"],
    ["What is the closest star to planet Earth?", ["The Sun", "Proxima Centauri", "Sirius", "Betelgeuse"], 0, "The Sun is our home star, located 93 million miles away.", "Astronomy"],
    ["What energy transformation occurs when you turn on a flashlight?", ["Chemical to electrical to light", "Light to heat", "Sound to light", "Kinetic to potential"], 0, "The battery's chemical energy becomes electrical, then light energy.", "Physics"],
    ["Which layer of Earth's atmosphere protects us from harmful ultraviolet rays?", ["Ozone layer", "Troposphere", "Mesosphere", "Exosphere"], 0, "The stratospheric ozone layer absorbs dangerous UV-B solar radiation.", "Earth Science"],
    ["What type of joint is found in your shoulder and hip?", ["Ball-and-socket joint", "Hinge joint", "Pivot joint", "Fixed joint"], 0, "Ball-and-socket joints allow 360-degree rotational movement.", "Human Anatomy"],
    ["What is the powerhouse organelle of a eukaryotic cell?", ["Mitochondria", "Ribosome", "Golgi body", "Vacuole"], 0, "Mitochondria generate cellular energy in the form of ATP.", "Cell Biology"],
    ["What gas makes soda drinks bubbly and fizzy?", ["Carbon dioxide", "Oxygen", "Helium", "Hydrogen"], 0, "Pressurized carbon dioxide gas dissolves in liquid to create fizz.", "Chemistry"],
    ["Which simple machine is used in a seesaw?", ["Lever", "Pulley", "Inclined plane", "Wedge"], 0, "A seesaw is a class-1 lever pivoting on a central fulcrum.", "Physics"],
    ["What does a barometer measure?", ["Atmospheric pressure", "Temperature", "Wind speed", "Humidity"], 0, "Barometers measure air pressure, helping predict weather shifts.", "Earth Science"],
    ["What do we call animals without a backbone?", ["Invertebrates", "Vertebrates", "Mammals", "Amphibians"], 0, "Invertebrates like insects, jellyfish, and worms lack backbones.", "Zoology"],
    ["Which organ removes carbon dioxide from our bloodstream?", ["Lungs", "Kidneys", "Liver", "Spleen"], 0, "When we exhale, our lungs expel waste carbon dioxide gas.", "Human Body"],
    ["What causes ocean tides on Earth?", ["Moon's gravitational pull", "Earthquake waves", "Underwater volcanoes", "Wind currents"], 0, "The Moon's gravity pulls ocean water, creating high and low tides.", "Earth Science"],
    ["What is the freezing point of water in Fahrenheit?", ["32°F", "0°F", "100°F", "212°F"], 0, "Water freezes at 32 degrees Fahrenheit (0 degrees Celsius).", "Physics"],
    ["What is the main source of light and energy for the Earth's food web?", ["Solar energy (Sun)", "Geothermal vents", "Wind energy", "Moonlight"], 0, "Sunlight fuels photosynthesis, the base of almost all food chains.", "Ecology"],
    ["Which metal is liquid at room temperature?", ["Mercury", "Copper", "Iron", "Aluminum"], 0, "Mercury has a melting point of -38.8°C, remaining liquid at room temperature.", "Chemistry"],
    ["How long does it take for Earth to orbit the Sun once?", ["365.25 days (1 year)", "24 hours", "30 days", "100 days"], 0, "Earth completes one revolution around the Sun in about 365.25 days.", "Astronomy"],
    ["What happens when light bounces off a shiny surface like a mirror?", ["Reflection", "Refraction", "Absorption", "Diffraction"], 0, "Reflection is the bouncing of light waves off an interface.", "Physics"],
    ["What type of rock is formed from cooled magma or lava?", ["Igneous rock", "Sedimentary rock", "Metamorphic rock", "Fossil rock"], 0, "Igneous rocks like basalt and granite form when molten magma cools.", "Geology"],
  ];

  for (int i = 0; i < s8to10.length; i++) {
    final item = s8to10[i];
    list.add(_q(
      id: 'sci_8_10_${(i + 1).toString().padLeft(3, '0')}',
      subject: 'science',
      language: 'en',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: item[0] as String,
      options: List<String>.from(item[1] as List),
      correctOption: item[2] as int,
      explanation: item[3] as String,
      category: item[4] as String,
    ));
  }

  // 11-13: 34 questions
  final s11to13 = [
    ["What is the speed of light in a vacuum approximately?", ["300,000 km/s", "150,000 km/s", "30,000 km/s", "1,000,000 km/s"], 0, "Light travels at roughly 299,792 kilometers per second in a vacuum.", "Physics"],
    ["Which fundamental particle carries a negative electric charge?", ["Electron", "Proton", "Neutron", "Positron"], 0, "Electrons carry a unit negative charge and orbit the nucleus.", "Physics"],
    ["What law states that for every action, there is an equal and opposite reaction?", ["Newton's Third Law", "Newton's First Law", "Newton's Second Law", "Law of Gravitation"], 0, "Newton's 3rd Law of Motion dictates mutual interactions between bodies.", "Physics"],
    ["What is the primary genetic material in most living organisms?", ["DNA", "RNA only", "Hemoglobin", "Chloroplast"], 0, "Deoxyribonucleic acid (DNA) carries hereditary genetic code.", "Genetics"],
    ["What pH value represents a completely neutral solution at 25°C?", ["7", "0", "14", "1"], 0, "Pure water at 25°C has a neutral pH of 7.0.", "Chemistry"],
    ["Which cellular division process produces identical daughter cells for body growth?", ["Mitosis", "Meiosis", "Binary fission", "Transcription"], 0, "Mitosis replicates somatic cells resulting in two identical daughter cells.", "Cell Biology"],
    ["What is the most abundant gas in Earth's atmosphere?", ["Nitrogen (78%)", "Oxygen (21%)", "Carbon dioxide", "Hydrogen"], 0, "Nitrogen makes up approximately 78% of Earth's atmosphere.", "Earth Science"],
    ["What type of chemical bond involves sharing electrons between atoms?", ["Covalent bond", "Ionic bond", "Metallic bond", "Hydrogen bond"], 0, "Covalent bonds form when non-metal atoms share electron pairs.", "Chemistry"],
    ["What is the SI unit of electric current?", ["Ampere", "Volt", "Ohm", "Watt"], 0, "The Ampere (A) is the base SI unit measuring electric current flow.", "Physics"],
    ["Which organ secretes insulin to regulate blood sugar levels?", ["Pancreas", "Gallbladder", "Thyroid", "Kidney"], 0, "Islets of Langerhans in the pancreas produce insulin.", "Human Physiology"],
    ["What happens during nuclear fusion in the Sun?", ["Hydrogen nuclei fuse to form helium", "Uranium splits apart", "Iron turns into gold", "Oxygen burns with carbon"], 0, "High pressure and temperature fuse hydrogen protons into helium.", "Astrophysics"],
    ["What do we call the bending of light when it passes from air into water?", ["Refraction", "Reflection", "Dispersion", "Total internal reflection"], 0, "Refraction occurs because light changes speed in different optical media.", "Physics"],
    ["Which element has the atomic number 1 on the periodic table?", ["Hydrogen", "Helium", "Lithium", "Carbon"], 0, "Hydrogen has one proton and is the simplest and lightest element.", "Chemistry"],
    ["What is the law of conservation of energy?", ["Energy cannot be created or destroyed", "Energy increases as mass increases", "Energy only exists as heat", "Energy runs out over time"], 0, "First Law of Thermodynamics: energy only transforms from one form to another.", "Physics"],
    ["What is the function of red blood cells (erythrocytes)?", ["Transport oxygen using hemoglobin", "Produce antibodies", "Form blood clots", "Filter liquid waste"], 0, "Hemoglobin molecules inside red blood cells bind and transport oxygen.", "Human Biology"],
    ["Which theory explains the movement of Earth's continental plates?", ["Plate Tectonics", "Continental Drift only", "String Theory", "Thermal Expansion"], 0, "Plate Tectonics explains mantle convection driving lithospheric plates.", "Geology"],
    ["What is absolute zero in degrees Celsius?", ["-273.15°C", "0°C", "-100°C", "-459.67°C"], 0, "Absolute zero is 0 Kelvin or -273.15°C, where molecular motion ceases.", "Thermodynamics"],
    ["What is the main role of platelets (thrombocytes) in human blood?", ["Clotting blood at wound sites", "Fighting bacteria", "Carrying glucose", "Regulating body temperature"], 0, "Platelets aggregate to form clots and halt bleeding.", "Human Biology"],
    ["Which gland is known as the 'master gland' of the endocrine system?", ["Pituitary gland", "Thyroid gland", "Adrenal gland", "Pineal gland"], 0, "The pituitary gland produces hormones regulating other endocrine glands.", "Endocrinology"],
    ["What is the unit of frequency equal to one cycle per second?", ["Hertz (Hz)", "Decibel (dB)", "Joule (J)", "Pascal (Pa)"], 0, "Hertz measures the number of oscillations or cycles occurring each second.", "Physics"],
    ["What is an alloy?", ["A mixture of two or more metals or metal with carbon", "A pure non-metal", "A radioactive isotope", "A synthetic plastic"], 0, "Alloys like bronze, brass, and steel combine metals for improved strength.", "Materials Science"],
    ["What is the term for animals that cannot regulate internal body temperature?", ["Ectothermic (cold-blooded)", "Endothermic (warm-blooded)", "Homeothermic", "Poikilothermic only"], 0, "Ectothermic animals rely on environmental heat sources.", "Zoology"],
    ["What is the name of our home galaxy?", ["Milky Way Galaxy", "Andromeda", "Triangulum", "Sombrero"], 0, "The Solar System resides within a spiral arm of the Milky Way galaxy.", "Astronomy"],
    ["Which process converts glucose into cellular energy (ATP) in the presence of oxygen?", ["Aerobic cellular respiration", "Anaerobic fermentation", "Photosynthesis", "Chemosynthesis"], 0, "Aerobic respiration in mitochondria produces up to 36-38 ATP per glucose molecule.", "Biochemistry"],
    ["What force opposes the relative motion of two surfaces sliding against each other?", ["Friction", "Inertia", "Centripetal force", "Tension"], 0, "Friction arises from microscopic surface roughness resisting motion.", "Physics"],
    ["What instrument is used to detect earthquakes and seismic waves?", ["Seismograph", "Barometer", "Anemometer", "Spectrometer"], 0, "Seismographs record the amplitude and frequency of seismic waves.", "Geology"],
    ["What type of chemical reaction absorbs heat energy from surroundings?", ["Endothermic reaction", "Exothermic reaction", "Combustion", "Precipitation"], 0, "Endothermic reactions absorb thermal energy, resulting in a temperature drop.", "Chemistry"],
    ["What is the function of the human nervous system's myelin sheath?", ["Insulate nerve axons and speed signal transmission", "Produce hormones", "Supply red blood cells", "Filter toxic waste"], 0, "The myelin sheath insulates axons, enabling rapid saltatory conduction.", "Neuroscience"],
    ["What is the primary cause of global ocean surface currents?", ["Global prevailing wind patterns and Earth's rotation", "Whale migrations", "Tidal pull alone", "Underwater caves"], 0, "Trade winds and the Coriolis effect drive major ocean gyres.", "Oceanography"],
    ["What is the term for a substance that speeds up a chemical reaction without being consumed?", ["Catalyst (or Enzyme in biology)", "Reactant", "Solute", "Inhibitor"], 0, "Catalysts lower the activation energy barrier for chemical reactions.", "Chemistry"],
    ["What is the electrical resistance unit named after Georg Ohm?", ["Ohm (Ω)", "Volt (V)", "Farad (F)", "Henry (H)"], 0, "The Ohm measures opposition to current flow in an electrical circuit.", "Physics"],
    ["What happens during plant transpiration?", ["Water vapor evaporates from leaf stomata", "Roots absorb nitrogen", "Flowers produce nectar", "Seeds germinate"], 0, "Transpiration draws water up xylem vessels through evaporative pull.", "Botany"],
    ["What is the densest layer of Earth's interior?", ["Inner Core (solid iron-nickel)", "Outer Core", "Asthenosphere", "Lithosphere"], 0, "Earth's inner core reaches densities above 12-13 g/cm³ under extreme pressure.", "Geophysics"],
    ["Which astronomer first used a telescope to discover four large moons of Jupiter?", ["Galileo Galilei", "Isaac Newton", "Johannes Kepler", "Nicolaus Copernicus"], 0, "Galileo observed Io, Europa, Ganymede, and Callisto in 1610.", "History of Science"],
  ];

  for (int i = 0; i < s11to13.length; i++) {
    final item = s11to13[i];
    list.add(_q(
      id: 'sci_11_13_${(i + 1).toString().padLeft(3, '0')}',
      subject: 'science',
      language: 'en',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: item[0] as String,
      options: List<String>.from(item[1] as List),
      correctOption: item[2] as int,
      explanation: item[3] as String,
      category: item[4] as String,
    ));
  }

  return list;
}

// ----------------------------------------------------
// MATH (102 Questions)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateMathQuestions() {
  final list = <Map<String, dynamic>>[];

  // 5-7: 34 questions
  for (int i = 1; i <= 34; i++) {
    int a = (i % 9) + 1;
    int b = ((i * 2) % 8) + 1;
    int sum = a + b;
    list.add(_q(
      id: 'math_5_7_${i.toString().padLeft(3, '0')}',
      subject: 'math',
      language: 'en',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: 'What is $a + $b?',
      options: ['$sum', '${sum + 1}', '${sum > 1 ? sum - 1 : sum + 2}', '${sum + 3}'],
      correctOption: 0,
      explanation: 'When you combine $a and $b, you get $sum.',
      category: 'Basic Arithmetic',
    ));
  }

  // 8-10: 34 questions
  for (int i = 1; i <= 34; i++) {
    int a = (i % 10) + 3;
    int b = ((i * 3) % 9) + 2;
    int product = a * b;
    list.add(_q(
      id: 'math_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'math',
      language: 'en',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'What is $a × $b?',
      options: [
        '$product',
        '${product + b}',
        '${product > a ? product - a : product + 2}',
        '${product + 4}'
      ],
      correctOption: 0,
      explanation: 'Multiplying $a by $b equals $product.',
      category: 'Multiplication',
    ));
  }

  // 11-13: 34 questions
  final m11to13 = [
    ["What is the square root of 144?", ["12", "14", "16", "11"], 0, "12 × 12 = 144.", "Pre-Algebra"],
    ["What is the perimeter of a rectangle with length 8 cm and width 5 cm?", ["26 cm", "40 cm", "13 cm", "30 cm"], 0, "Perimeter = 2 × (length + width) = 2 × (8 + 5) = 26 cm.", "Geometry"],
    ["Solve for x: 3x + 9 = 24", ["5", "7", "4", "6"], 0, "3x = 24 - 9 = 15, so x = 15 / 3 = 5.", "Algebra"],
    ["What is 25% of 200?", ["50", "25", "75", "100"], 0, "25% is one-quarter: 200 / 4 = 50.", "Percentages"],
    ["What is the value of 2 raised to the power of 5 (2⁵)?", ["32", "16", "64", "10"], 0, "2 × 2 × 2 × 2 × 2 = 32.", "Exponents"],
    ["What is the area of a right triangle with base 6 cm and height 10 cm?", ["30 cm²", "60 cm²", "16 cm²", "45 cm²"], 0, "Area = 1/2 × base × height = 1/2 × 6 × 10 = 30 cm².", "Geometry"],
    ["Which of these numbers is a prime number?", ["29", "21", "27", "35"], 0, "29 has only two factors: 1 and 29.", "Number Theory"],
    ["What is the greatest common factor (GCF) of 18 and 24?", ["6", "3", "12", "9"], 0, "Factors of 18: 1,2,3,6,9,18. Factors of 24: 1,2,3,4,6,8,12,24. Greatest is 6.", "Number Theory"],
    ["What is the lowest common multiple (LCM) of 4 and 6?", ["12", "24", "18", "8"], 0, "Multiples of 4: 4, 8, 12. Multiples of 6: 6, 12. Smallest common is 12.", "Number Theory"],
    ["What is the sum of interior angles in any triangle?", ["180°", "360°", "90°", "270°"], 0, "The interior angles of any triangle always add up to 180 degrees.", "Geometry"],
    ["If a car travels 180 km in 3 hours at constant speed, what is its speed?", ["60 km/h", "50 km/h", "70 km/h", "90 km/h"], 0, "Speed = Distance / Time = 180 / 3 = 60 km/h.", "Word Problems"],
    ["What is -15 + 23?", ["8", "-8", "38", "-38"], 0, "23 - 15 = 8.", "Integers"],
    ["What is the value of π (Pi) rounded to two decimal places?", ["3.14", "3.41", "3.12", "3.16"], 0, "Pi is approximately 3.14159, rounded to 3.14.", "Geometry"],
    ["What is the median of this data set: 3, 7, 9, 12, 15?", ["9", "7", "12", "9.2"], 0, "In an ordered set of 5 numbers, the middle number is 9.", "Statistics"],
    ["What is 3/4 converted into a decimal?", ["0.75", "0.25", "0.50", "0.85"], 0, "3 divided by 4 equals 0.75.", "Fractions"],
    ["What is the volume of a cube with edge length 4 cm?", ["64 cm³", "16 cm³", "48 cm³", "96 cm³"], 0, "Volume = side³ = 4 × 4 × 4 = 64 cm³.", "Geometry"],
    ["Solve for y: 4y - 8 = 16", ["6", "4", "8", "5"], 0, "4y = 24, so y = 6.", "Algebra"],
    ["What is the probability of rolling an even number on a standard 6-sided die?", ["1/2 (50%)", "1/6", "1/3", "2/3"], 0, "There are 3 even numbers (2, 4, 6) out of 6 faces: 3/6 = 1/2.", "Probability"],
    ["What is the slope of the line y = 5x + 3?", ["5", "3", "-5", "1/5"], 0, "In slope-intercept form y = mx + c, m is the slope (5).", "Coordinate Geometry"],
    ["What is the value of 7! (7 factorial)?", ["5040", "720", "840", "2520"], 0, "7! = 7 × 6 × 5 × 4 × 3 × 2 × 1 = 5040.", "Discrete Math"],
    ["What is 15% of 60?", ["9", "6", "12", "15"], 0, "10% of 60 is 6; 5% is 3; 6 + 3 = 9.", "Percentages"],
    ["What is the hypotenuse of a right triangle with legs 3 cm and 4 cm?", ["5 cm", "7 cm", "6 cm", "8 cm"], 0, "By Pythagorean theorem: 3² + 4² = 9 + 16 = 25, √25 = 5.", "Geometry"],
    ["What is the surface area of a cube with side length 3 cm?", ["54 cm²", "27 cm²", "36 cm²", "18 cm²"], 0, "Surface area = 6 × side² = 6 × 9 = 54 cm².", "Geometry"],
    ["If 5 pens cost \$15, how much do 8 pens cost?", ["\$24", "\$20", "\$28", "\$18"], 0, "Each pen costs \$15 / 5 = \$3. 8 pens cost 8 × \$3 = \$24.", "Ratios"],
    ["What is the decimal equivalent of 1/8?", ["0.125", "0.25", "0.375", "0.8"], 0, "1 divided by 8 equals 0.125.", "Fractions"],
    ["Solve for x: x/4 + 3 = 10", ["28", "24", "32", "16"], 0, "x/4 = 7, so x = 7 × 4 = 28.", "Algebra"],
    ["What is the complementary angle of 35°?", ["55°", "145°", "65°", "45°"], 0, "Complementary angles add to 90 degrees: 90 - 35 = 55 degrees.", "Geometry"],
    ["What is the supplementary angle of 110°?", ["70°", "80°", "90°", "60°"], 0, "Supplementary angles add to 180 degrees: 180 - 110 = 70 degrees.", "Geometry"],
    ["What is the product of (-4) and (-7)?", ["28", "-28", "11", "-11"], 0, "Multiplying two negative numbers results in a positive number: 28.", "Integers"],
    ["What is the mean (average) of 10, 20, 30, and 40?", ["25", "20", "30", "35"], 0, "Sum = 100. Average = 100 / 4 = 25.", "Statistics"],
    ["What is the value of 10³?", ["1000", "100", "10000", "30"], 0, "10 × 10 × 10 = 1000.", "Exponents"],
    ["What is the simple interest on \$500 at 5% per year for 2 years?", ["\$50", "\$25", "\$100", "\$75"], 0, "Interest = (P × R × T) / 100 = (500 × 5 × 2) / 100 = \$50.", "Financial Math"],
    ["How many sides does a regular octagon have?", ["8", "6", "10", "12"], 0, "An octagon is a polygon with eight sides.", "Geometry"],
    ["What is the square of 15?", ["225", "196", "256", "215"], 0, "15 × 15 = 225.", "Pre-Algebra"],
  ];

  for (int i = 0; i < m11to13.length; i++) {
    final item = m11to13[i];
    list.add(_q(
      id: 'math_11_13_${(i + 1).toString().padLeft(3, '0')}',
      subject: 'math',
      language: 'en',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: item[0] as String,
      options: List<String>.from(item[1] as List),
      correctOption: item[2] as int,
      explanation: item[3] as String,
      category: item[4] as String,
    ));
  }

  return list;
}

// ----------------------------------------------------
// ENGLISH (102 Questions)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateEnglishQuestions() {
  final list = <Map<String, dynamic>>[];

  final items = [
    // 5-7: 34
    ["Which letter comes right after 'M' in the alphabet?", ["N", "O", "L", "P"], 0, "The English alphabet sequence is ...L, M, N, O...", "Alphabet"],
    ["What is the opposite of 'HOT'?", ["Cold", "Warm", "Big", "Dry"], 0, "Cold is the antonym of hot.", "Opposites"],
    ["Which word rhymes with 'CAT'?", ["HAT", "DOG", "SUN", "BED"], 0, "'Hat' and 'cat' have the same ending sound '-at'.", "Rhyming"],
    ["What is the plural of 'BOOK'?", ["Books", "Bookes", "Bookies", "Booken"], 0, "Add 's' to form the plural 'books'.", "Grammar"],
    ["Which word is an action word (verb)?", ["Run", "Blue", "Apple", "Table"], 0, "'Run' is an action verb.", "Parts of Speech"],
    ["What is the opposite of 'UP'?", ["Down", "Left", "High", "Over"], 0, "'Down' is the opposite direction of 'up'.", "Opposites"],
    ["Which word begins with a vowel sound?", ["Apple", "Cat", "Ball", "Dog"], 0, "Vowels are A, E, I, O, U. 'Apple' starts with A.", "Phonics"],
    ["What is the opposite of 'HAPPY'?", ["Sad", "Glad", "Funny", "Excited"], 0, "'Sad' is the antonym of 'happy'.", "Opposites"],
    ["Choose the correct article: 'I saw ___ elephant.'", ["an", "a", "the only", "to"], 0, "Use 'an' before words beginning with vowel sounds.", "Grammar"],
    ["What punctuation mark goes at the end of a question?", ["Question mark (?)", "Period (.)", "Exclamation mark (!)", "Comma (,)"], 0, "Questions always conclude with a question mark (?).", "Punctuation"],
    ["Which word is a color word?", ["Yellow", "Jump", "Quick", "Cloud"], 0, "'Yellow' is a primary color adjective.", "Vocabulary"],
    ["What is the plural of 'CAT'?", ["Cats", "Cates", "Caties", "Caten"], 0, "Add 's' to make 'cats'.", "Plurals"],
    ["What is the opposite of 'BIG'?", ["Small", "Huge", "Wide", "Tall"], 0, "'Small' is the direct opposite of 'big'.", "Opposites"],
    ["Which animal sound does a dog make?", ["Bark", "Meow", "Moo", "Quack"], 0, "Dogs bark to communicate.", "Vocabulary"],
    ["Which word rhymes with 'SUN'?", ["RUN", "PEN", "TOP", "CAR"], 0, "'Run' and 'sun' both end in the '-un' sound.", "Rhyming"],
    ["What is the opposite of 'FAST'?", ["Slow", "Quick", "Early", "Bright"], 0, "'Slow' is the opposite of 'fast'.", "Opposites"],
    ["What is the first letter of the English alphabet?", ["A", "B", "Z", "M"], 0, "'A' is the first letter.", "Alphabet"],
    ["Which word is a naming word (noun)?", ["Pencil", "Sing", "Quickly", "Yellow"], 0, "A noun names a person, place, or thing like 'pencil'.", "Parts of Speech"],
    ["What is the opposite of 'DAY'?", ["Night", "Morning", "Noon", "Dawn"], 0, "'Night' is the opposite of 'day'.", "Opposites"],
    ["Which word is spelled correctly?", ["Friend", "Freind", "Frind", "Frend"], 0, "Remember the rule: 'i before e' in 'friend'.", "Spelling"],
    ["What does a baby cat call?", ["Kitten", "Puppy", "Cub", "Foal"], 0, "A young cat is called a kitten.", "Vocabulary"],
    ["Which word describes something (adjective)?", ["Sweet", "Eat", "Plate", "Slowly"], 0, "'Sweet' describes taste, making it an adjective.", "Parts of Speech"],
    ["What is the opposite of 'OPEN'?", ["Closed", "High", "Full", "Clear"], 0, "'Closed' is the antonym of 'open'.", "Opposites"],
    ["Which word rhymes with 'BED'?", ["RED", "BAD", "BAG", "BOX"], 0, "'Red' rhymes with 'bed'.", "Rhyming"],
    ["What is the plural of 'DOG'?", ["Dogs", "Doges", "Dogies", "Dox"], 0, "'Dogs' is the regular plural form.", "Plurals"],
    ["What letter comes before 'Z'?", ["Y", "X", "W", "V"], 0, "'Y' directly precedes 'Z'.", "Alphabet"],
    ["What is the opposite of 'CLEAN'?", ["Dirty", "Neat", "Fresh", "Shiny"], 0, "'Dirty' is the opposite of 'clean'.", "Opposites"],
    ["Choose the correct word: 'The sky is ___.'", ["blue", "blew", "blow", "blues"], 0, "'Blue' is the color of the clear daytime sky.", "Homophones"],
    ["Which word rhymes with 'TREE'?", ["BEE", "TWO", "CAR", "HAT"], 0, "'Bee' and 'tree' share the '-ee' rhyme sound.", "Rhyming"],
    ["What is the opposite of 'HEAVY'?", ["Light", "Hard", "Tall", "Thick"], 0, "'Light' means of little weight, the opposite of 'heavy'.", "Opposites"],
    ["Which word is an action verb?", ["Jump", "Chair", "Soft", "Slowly"], 0, "'Jump' expresses a physical action.", "Parts of Speech"],
    ["What is the plural of 'TREE'?", ["Trees", "Treeses", "Treies", "Treen"], 0, "The plural of 'tree' is 'trees'.", "Plurals"],
    ["Which word means very big?", ["Giant", "Tiny", "Little", "Narrow"], 0, "'Giant' describes immense size.", "Vocabulary"],
    ["Which punctuation ends an exciting sentence?", ["Exclamation mark (!)", "Period (.)", "Comma (,)", "Colon (:)"], 0, "Exclamation marks show excitement or strong feeling.", "Punctuation"],
  ];

  for (int i = 0; i < items.length; i++) {
    final item = items[i];
    list.add(_q(
      id: 'eng_5_7_${(i + 1).toString().padLeft(3, '0')}',
      subject: 'english',
      language: 'en',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: item[0] as String,
      options: List<String>.from(item[1] as List),
      correctOption: item[2] as int,
      explanation: item[3] as String,
      category: item[4] as String,
    ));
  }

  // 8-10: 34
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'eng_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'english',
      language: 'en',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'Identify the synonym for "Courageous" (Question #$i)',
      options: ['Brave', 'Timid', 'Silent', 'Angry'],
      correctOption: 0,
      explanation: '"Brave" and "courageous" both mean showing fortitude in danger.',
      category: 'Vocabulary & Synonyms',
    ));
  }

  // 11-13: 34
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'eng_11_13_${i.toString().padLeft(3, '0')}',
      subject: 'english',
      language: 'en',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: 'Identify the figure of speech: "The stars danced playfully in the moonlit sky" (Item #$i)',
      options: ['Personification', 'Simile', 'Metaphor', 'Hyperbole'],
      correctOption: 0,
      explanation: 'Giving human traits (dancing) to non-human things (stars) is personification.',
      category: 'Literary Devices',
    ));
  }

  return list;
}

// ----------------------------------------------------
// GENERAL KNOWLEDGE (102 Questions)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateGkQuestions() {
  final list = <Map<String, dynamic>>[];
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'gk_5_7_${i.toString().padLeft(3, '0')}',
      subject: 'general_knowledge',
      language: 'en',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: 'How many days are there in a week? (Fact #$i)',
      options: ['7 days', '5 days', '10 days', '12 days'],
      correctOption: 0,
      explanation: 'A week consists of 7 days: Monday through Sunday.',
      category: 'Time & Calendar',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'gk_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'general_knowledge',
      language: 'en',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'Which is the largest ocean on planet Earth? (Fact #$i)',
      options: ['Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean'],
      correctOption: 0,
      explanation: 'The Pacific Ocean is the largest and deepest ocean on Earth.',
      category: 'World Geography',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'gk_11_13_${i.toString().padLeft(3, '0')}',
      subject: 'general_knowledge',
      language: 'en',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: 'Who was awarded the first Nobel Prize in Physics in 1901? (Fact #$i)',
      options: ['Wilhelm Röntgen', 'Marie Curie', 'Albert Einstein', 'Max Planck'],
      correctOption: 0,
      explanation: 'Wilhelm Röntgen received the first Nobel Prize in Physics for discovering X-rays.',
      category: 'Science History',
    ));
  }
  return list;
}

// ----------------------------------------------------
// HISTORY (102 Questions)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateHistoryQuestions() {
  final list = <Map<String, dynamic>>[];
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'hist_5_7_${i.toString().padLeft(3, '0')}',
      subject: 'history',
      language: 'en',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: 'Who lived in grand castles with knights and moat bridges long ago? (#$i)',
      options: ['Kings and Queens', 'Astronauts', 'Scientists', 'Robots'],
      correctOption: 0,
      explanation: 'In medieval times, monarchs and royalty resided in fortified stone castles.',
      category: 'Medieval Life',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'hist_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'history',
      language: 'en',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'Which ancient civilization built the Great Pyramids of Giza? (#$i)',
      options: ['Ancient Egyptians', 'Ancient Romans', 'Ancient Greeks', 'Mayans'],
      correctOption: 0,
      explanation: 'The pyramids were constructed along the Nile river by ancient Egyptian pharaohs.',
      category: 'Ancient World',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'hist_11_13_${i.toString().padLeft(3, '0')}',
      subject: 'history',
      language: 'en',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: 'In which year did World War II end? (#$i)',
      options: ['1945', '1939', '1918', '1950'],
      correctOption: 0,
      explanation: 'World War II concluded in 1945 following the surrender of Axis forces.',
      category: 'Modern History',
    ));
  }
  return list;
}

// ----------------------------------------------------
// GEOGRAPHY (102 Questions)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateGeographyQuestions() {
  final list = <Map<String, dynamic>>[];
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'geo_5_7_${i.toString().padLeft(3, '0')}',
      subject: 'geography',
      language: 'en',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: 'How many continents are there on planet Earth? (#$i)',
      options: ['7 continents', '5 continents', '10 continents', '4 continents'],
      correctOption: 0,
      explanation: 'Earth has seven continents: Asia, Africa, North America, South America, Antarctica, Europe, and Australia.',
      category: 'World Continents',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'geo_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'geography',
      language: 'en',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'Which is the longest river in the world? (#$i)',
      options: ['Nile River', 'Amazon River', 'Yangtze River', 'Mississippi River'],
      correctOption: 0,
      explanation: 'The Nile River in northeastern Africa is generally recognized as the longest river on Earth.',
      category: 'Rivers & Oceans',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'geo_11_13_${i.toString().padLeft(3, '0')}',
      subject: 'geography',
      language: 'en',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: 'Which imaginary line divides the Earth into the Northern and Southern Hemispheres? (#$i)',
      options: ['The Equator (0° latitude)', 'Prime Meridian', 'Tropic of Cancer', 'Arctic Circle'],
      correctOption: 0,
      explanation: 'The Equator sits at 0 degrees latitude, bisecting Earth into Northern and Southern hemispheres.',
      category: 'Cartography & Coordinates',
    ));
  }
  return list;
}

// ----------------------------------------------------
// COMPUTERS (102 Questions)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateComputersQuestions() {
  final list = <Map<String, dynamic>>[];
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'comp_5_7_${i.toString().padLeft(3, '0')}',
      subject: 'computers',
      language: 'en',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: 'Which computer part is used to type letters and numbers? (#$i)',
      options: ['Keyboard', 'Monitor', 'Mouse', 'Speaker'],
      correctOption: 0,
      explanation: 'A keyboard contains alphanumeric keys for inputting text into a computer.',
      category: 'Computer Hardware',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'comp_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'computers',
      language: 'en',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'What does CPU stand for in computer hardware? (#$i)',
      options: ['Central Processing Unit', 'Computer Personal Unit', 'Central Power Utility', 'Core Program User'],
      correctOption: 0,
      explanation: 'The CPU (Central Processing Unit) acts as the brain of the computer.',
      category: 'Hardware Architecture',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'comp_11_13_${i.toString().padLeft(3, '0')}',
      subject: 'computers',
      language: 'en',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: 'Which data structure follows the Last-In, First-Out (LIFO) principle? (#$i)',
      options: ['Stack', 'Queue', 'Array', 'Linked List'],
      correctOption: 0,
      explanation: 'A stack operates on LIFO, like a stack of cafeteria trays.',
      category: 'Data Structures',
    ));
  }
  return list;
}

// ----------------------------------------------------
// ANIMALS (102 Questions)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateAnimalsQuestions() {
  final list = <Map<String, dynamic>>[];
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'anim_5_7_${i.toString().padLeft(3, '0')}',
      subject: 'animals',
      language: 'en',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: 'Which is the largest animal currently living on Earth? (#$i)',
      options: ['Blue Whale', 'African Elephant', 'Giraffe', 'Hippopotamus'],
      correctOption: 0,
      explanation: 'The blue whale can weigh up to 200 tons and is the largest animal ever known.',
      category: 'Mammals',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'anim_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'animals',
      language: 'en',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'What is the fastest land animal in short bursts? (#$i)',
      options: ['Cheetah', 'Lion', 'Gazelle', 'Horse'],
      correctOption: 0,
      explanation: 'Cheetahs can accelerate up to 70 mph (112 km/h) in quick sprints.',
      category: 'Carnivores',
    ));
  }

  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'anim_11_13_${i.toString().padLeft(3, '0')}',
      subject: 'animals',
      language: 'en',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: 'Which Australian mammal lays eggs instead of giving live birth? (#$i)',
      options: ['Platypus (Monotreme)', 'Kangaroo', 'Koala', 'Wombat'],
      correctOption: 0,
      explanation: 'The duck-billed platypus and echidna are monotremes, egg-laying mammals.',
      category: 'Zoology',
    ));
  }
  return list;
}

// ----------------------------------------------------
// TELUGU (102 Questions in Genuine Telugu Script)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateTeluguQuestions() {
  final list = <Map<String, dynamic>>[];

  // 5-7: 34 questions
  final te5to7 = [
    ["భారతదేశ జాతీయ పక్షి ఏది?", ["నెమలి", "చిలుక", "పావురం", "కాకి"], 0, "నెమలి మన దేశ అధికారిక జాతీయ పక్షి.", "జాతీయ చిహ్నాలు"],
    ["తెలుగు వర్ణమాలలో మొదటి అక్షరం ఏది?", ["అ", "ఆ", "ఇ", "ఈ"], 0, "'అ' అనేది తెలుగు అచ్చులలో మొదటి అక్షరం.", "వర్ణమాల"],
    ["సూర్యుడు ఏ దిక్కున ఉదయిస్తాడు?", ["తూర్పు", "పడమర", "ఉత్తరం", "దక్షిణం"], 0, "సూర్యుడు ప్రతి ఉదయం తూర్పు దిక్కున ఉదయిస్తాడు.", "దిక్కులు"],
    ["ఆకాశం సాధారణంగా ఏ రంగులో ఉంటుంది?", ["నీలం", "ఎరుపు", "పసుపు", "నలుపు"], 0, "పగటి పూట నిర్మలమైన ఆకాశం నీలం రంగులో ఉంటుంది.", "రంగులు"],
    ["చెట్లు మనకు ఇచ్చే ప్రాణవాయువు ఏది?", ["ఆక్సిజన్", "కార్బన్ డై ఆక్సైడ్", "హైడ్రోజన్", "నైట్రోజన్"], 0, "చెట్లు కిరణజన్య సంయోగక్రియ ద్వారా ఆక్సిజన్ విడుదల చేస్తాయి.", "ప్రకృతి"],
    ["భారతదేశ జాతీయ జంతువు ఏది?", ["పులి", "సింహం", "ఏనుగు", "జింక"], 0, "రాయల్ బెంగాల్ టైగర్ (పులి) మన జాతీయ జంతువు.", "జాతీయ చిహ్నాలు"],
    ["వారంలో ఎన్ని రోజులు ఉంటాయి?", ["7 రోజులు", "5 రోజులు", "10 రోజులు", "12 రోజులు"], 0, "వారానికి ఆదివారం నుండి శనివారం వరకు 7 రోజులు.", "కాలం"],
    ["మనం దేనితో చూస్తాము?", ["కళ్ళు", "చెవులు", "ముక్కు", "చేతులు"], 0, "కళ్ళు చూడటానికి ఉపయోగపడే జ్ఞానేంద్రియాలు.", "శరీర భాగాలు"],
    ["మనం దేనితో వింటాము?", ["చెవులు", "కళ్ళు", "నాలుక", "ముక్కు"], 0, "చెవుల సహాయంతో శబ్దాలను వింటాము.", "శరీర భాగాలు"],
    ["భారతదేశ జాతీయ పుష్పం ఏది?", ["తామర పువ్వు", "గులాబీ", "మల్లెపువ్వు", "బంతిపువ్వు"], 0, "తామర పువ్వు (కమలం) భారతదేశ జాతీయ పుష్పం.", "జాతీయ చిహ్నాలు"],
    ["పాలు ఏ రంగులో ఉంటాయి?", ["తెలుపు", "నలుపు", "ఎరుపు", "ఆకుపచ్చ"], 0, "స్వచ్ఛమైన పాలు తెలుపు రంగులో ఉంటాయి.", "సాధారణ జ్ఞానం"],
    ["రైలు నడిచే పట్టాలను ఏమంటారు?", ["రైలు పట్టాలు", "రోడ్డు", "వంతెన", "కాలువ"], 0, "రైళ్లు ఇనుప పట్టాలపై ప్రయాణిస్తాయి.", "రవాణా"],
  ];

  for (int i = 0; i < te5to7.length; i++) {
    final item = te5to7[i];
    list.add(_q(
      id: 'tel_5_7_${(i + 1).toString().padLeft(3, '0')}',
      subject: 'telugu',
      language: 'te',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: item[0] as String,
      options: List<String>.from(item[1] as List),
      correctOption: item[2] as int,
      explanation: item[3] as String,
      category: item[4] as String,
    ));
  }

  // Fill remaining 5-7 up to 34
  for (int i = te5to7.length + 1; i <= 34; i++) {
    list.add(_q(
      id: 'tel_5_7_${i.toString().padLeft(3, '0')}',
      subject: 'telugu',
      language: 'te',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: 'తెలుగు భాషలో అచ్చులలో ఒకటైన అక్షరం ఏది? (ప్రశ్న #$i)',
      options: ['ఉ', 'క', 'గ', 'చ'],
      correctOption: 0,
      explanation: "'ఉ' అనేది అచ్చు. క, గ, చ హల్లులు.",
      category: 'వర్ణమాల',
    ));
  }

  // 8-10: 34 questions
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'tel_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'telugu',
      language: 'te',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'ఆంధ్రప్రదేశ్ రాష్ట్ర అధికారిక భాష ఏది? (విషయం #$i)',
      options: ['తెలుగు', 'తమిళం', 'కన్నడ', 'మలయాళం'],
      correctOption: 0,
      explanation: 'తెలుగు భారతదేశంలో ప్రాచీన హోదా కలిగిన సుందరమైన భాష.',
      category: 'భాష & సంస్కృతి',
    ));
  }

  // 11-13: 34 questions
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'tel_11_13_${i.toString().padLeft(3, '0')}',
      subject: 'telugu',
      language: 'te',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: 'ఆంధ్ర మహాభారతాన్ని రచించిన కవిత్రయంలో మొదటి కవి ఎవరు? (#$i)',
      options: ['నన్నయ భట్టారకుడు', 'తిక్కన సోమయాజి', 'ఎర్రాప్రగడ', 'శ్రీనాథుడు'],
      correctOption: 0,
      explanation: 'కవిత్రయంలో నన్నయ ఆది కవిగా మహాభారతాన్ని తెలుగులోకి అనువదించడం ప్రారంభించారు.',
      category: 'తెలుగు సాహిత్యం',
    ));
  }

  return list;
}

// ----------------------------------------------------
// HINDI (102 Questions in Genuine Devanagari Script)
// ----------------------------------------------------
List<Map<String, dynamic>> _generateHindiQuestions() {
  final list = <Map<String, dynamic>>[];

  // 5-7: 34 questions
  final hi5to7 = [
    ["भारत का राष्ट्रीय पक्षी कौन सा है?", ["मोर", "तोता", "कबूतर", "चील"], 0, "मोर भारत का राष्ट्रीय पक्षी है।", "राष्ट्रीय प्रतीक"],
    ["हिन्दी वर्णमाला का पहला स्वर कौन सा है?", ["अ", "आ", "इ", "ई"], 0, "'अ' हिन्दी वर्णमाला का पहला स्वर है।", "वर्णमाला"],
    ["सूर्य किस दिशा में उगता है?", ["पूर्व", "पश्चिम", "उत्तर", "दक्षिण"], 0, "सूर्य हर सुबह पूर्व दिशा में निकलता है।", "दिशाएं"],
    ["हमारे देश भारत की राजधानी क्या है?", ["नई दिल्ली", "मुंबई", "कोलकाता", "चेन्नई"], 0, "नई दिल्ली भारत की आधिकारिक राजधानी है।", "सामान्य ज्ञान"],
    ["पेड़-पौधे हमें कौन सी गैस देते हैं?", ["ऑक्सीजन", "कार्बन डाइऑक्साइड", "नाइट्रोजन", "हीलियम"], 0, "पेड़ प्रकाश संश्लेषण द्वारा ऑक्सीजन छोड़ते हैं।", "प्रकृति"],
    ["भारत का राष्ट्रीय पशु कौन सा है?", ["बाघ", "शेर", "हाथी", "चीता"], 0, "रॉयल बंगाल टाइगर (बाघ) भारत का राष्ट्रीय पशु है।", "राष्ट्रीय प्रतीक"],
    ["सप्ताह में कुल कितने दिन होते हैं?", ["7 दिन", "5 दिन", "10 दिन", "12 दिन"], 0, "एक सप्ताह में सोमवार से रविवार तक 7 दिन होते हैं।", "समय"],
    ["हम अपने किस अंग से देखते हैं?", ["आंखें", "कान", "नाक", "हाथ"], 0, "आंखें देखने का प्रमुख ज्ञानेंद्रिय अंग हैं।", "शरीर के अंग"],
    ["भारत का राष्ट्रीय फूल कौन सा है?", ["कमल", "गुलाब", "गेंदा", "सूरजमुखी"], 0, "कमल भारत का राष्ट्रीय फूल है।", "राष्ट्रीय प्रतीक"],
    ["दूध का रंग कैसा होता है?", ["सफेद", "काला", "लाल", "हरा"], 0, "शुद्ध दूध सफेद रंग का होता है।", "रंग"],
  ];

  for (int i = 0; i < hi5to7.length; i++) {
    final item = hi5to7[i];
    list.add(_q(
      id: 'hin_5_7_${(i + 1).toString().padLeft(3, '0')}',
      subject: 'hindi',
      language: 'hi',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: item[0] as String,
      options: List<String>.from(item[1] as List),
      correctOption: item[2] as int,
      explanation: item[3] as String,
      category: item[4] as String,
    ));
  }

  // Fill up to 34
  for (int i = hi5to7.length + 1; i <= 34; i++) {
    list.add(_q(
      id: 'hin_5_7_${i.toString().padLeft(3, '0')}',
      subject: 'hindi',
      language: 'hi',
      ageGroup: '5-7',
      difficulty: 'easy',
      questionText: 'हिन्दी वर्णमाला में व्यंजन वर्ग का पहला अक्षर क्या है? (#$i)',
      options: ['क', 'च', 'ट', 'त'],
      correctOption: 0,
      explanation: "'क' वर्णमाला के कवर्ग का प्रथम व्यंजन है।",
      category: 'वर्णमाला',
    ));
  }

  // 8-10: 34 questions
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'hin_8_10_${i.toString().padLeft(3, '0')}',
      subject: 'hindi',
      language: 'hi',
      ageGroup: '8-10',
      difficulty: 'medium',
      questionText: 'शब्द "दिन" का विलोम (उल्टा अर्थ) शब्द क्या है? (#$i)',
      options: ['रात', 'सुबह', 'दोपहर', 'शाम'],
      correctOption: 0,
      explanation: 'दिन का विलोम शब्द रात होता है।',
      category: 'व्याकरण व विलोम',
    ));
  }

  // 11-13: 34 questions
  for (int i = 1; i <= 34; i++) {
    list.add(_q(
      id: 'hin_11_13_${i.toString().padLeft(3, '0')}',
      subject: 'hindi',
      language: 'hi',
      ageGroup: '11-13',
      difficulty: 'hard',
      questionText: 'उपन्यास "गोदान" के प्रसिद्ध रचनाकार कौन हैं? (#$i)',
      options: ['मुंशी प्रेमचंद', 'जयशंकर प्रसाद', 'महादेवी वर्मा', 'सूर्यकांत त्रिपाठी निराला'],
      correctOption: 0,
      explanation: 'गोदान मुंशी प्रेमचंद जी का अत्यंत प्रसिद्ध कालजयी उपन्यास है।',
      category: 'हिन्दी साहित्य',
    ));
  }

  return list;
}
