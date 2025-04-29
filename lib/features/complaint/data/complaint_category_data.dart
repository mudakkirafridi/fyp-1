// complaint_categories_data.dart
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_main_category_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_sub_category_model.dart';

final List<ComplaintCategoryModel> complaintCategories = [
  ComplaintCategoryModel(
    name: 'Academics',
    iconPath: 'assets/images/icons/academics.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Lecturer Issues',
        level3Categories: [
          ComplaintLevel3Model(name: 'Inconsistent teaching methods'),
          ComplaintLevel3Model(name: 'Unavailability during class hours'),
          ComplaintLevel3Model(name: 'Miscommunication of course material'),
          ComplaintLevel3Model(name: 'Unfair treatment of students'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Course Content',
        level3Categories: [
          ComplaintLevel3Model(name: 'Irrelevant or outdated syllabus'),
          ComplaintLevel3Model(name: 'Inadequate course materials'),
          ComplaintLevel3Model(name: 'Course overload or underload'),
          ComplaintLevel3Model(name: 'Lack of practical or hands-on learning opportunities'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Exam and Assessment',
        level3Categories: [
          ComplaintLevel3Model(name: 'Unfair marking/grading'),
          ComplaintLevel3Model(name: 'Delayed exam results'),
          ComplaintLevel3Model(name: 'Exam timetable issues'),
          ComplaintLevel3Model(name: 'Cheating or malpractice in exams'),
          ComplaintLevel3Model(name: 'Discrepancy in internal/external evaluation'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
ComplaintSubCategoryModel(
        name: 'Classroom Environment',
        level3Categories: [
          ComplaintLevel3Model(name: 'Poor classroom conditions (AC, lighting, seating)'),
          ComplaintLevel3Model(name: 'Disruptive student behavior'),
          ComplaintLevel3Model(name: 'Overcrowded classrooms'),
           ComplaintLevel3Model(name: 'Other'),
        ],
      ),
        ComplaintSubCategoryModel(
        name: 'Academic Advising',
        level3Categories: [
          ComplaintLevel3Model(name: 'Unresponsive academic advisors'),
          ComplaintLevel3Model(name: 'Incorrect academic guidance'),
          ComplaintLevel3Model(name: 'Poor mentoring or career advice'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      
    ],
  ),
    
  // Administrative Complaints
  ComplaintCategoryModel(
    name: 'Administration',
    iconPath: 'assets/images/icons/administration.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Admissions Complaints',
        level3Categories: [
          ComplaintLevel3Model(name: 'Delays in application processing'),
          ComplaintLevel3Model(name: 'Errors in admission decisions'),
          ComplaintLevel3Model(name: 'Issues with eligibility criteria'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Registration',
        level3Categories: [
          ComplaintLevel3Model(name: 'Problems with course registration'),
          ComplaintLevel3Model(name: 'Enrollment issues'),
          ComplaintLevel3Model(name: 'Incorrect or missing information in the system'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Fee Payment',
        level3Categories: [
          ComplaintLevel3Model(name: 'Incorrect fee charges'),
          ComplaintLevel3Model(name: 'Issues with online payment portal'),
          ComplaintLevel3Model(name: 'Lack of installment or deferred payment options'),
         ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Exams and Transcripts',
        level3Categories: [
          ComplaintLevel3Model(name: 'Errors in transcript records'),
          ComplaintLevel3Model(name: 'Delays in transcript issuance'),
          ComplaintLevel3Model(name: 'Mistakes in certificates or diplomas'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Library Services',
        level3Categories: [
          ComplaintLevel3Model(name: 'Lack of resources (books, digital content)'),
          ComplaintLevel3Model(name: 'Long waiting periods for reserved materials'),
          ComplaintLevel3Model(name: 'Library staff unhelpfulness'),
          ComplaintLevel3Model(name: 'Issues with digital access to library resources'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Transport Issues',
        level3Categories: [
          ComplaintLevel3Model(name: 'Inadequate transport service'),
          ComplaintLevel3Model(name: 'Delayed college buses'),
          ComplaintLevel3Model(name: 'Route unavailability'),
          ComplaintLevel3Model(name: 'Overcrowded buses or insufficient seating'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Hostel/Accommodation',
        level3Categories: [
          ComplaintLevel3Model(name: 'Room allocation issues'),
          ComplaintLevel3Model(name: 'Poor hostel conditions (sanitation, power outages)'),
          ComplaintLevel3Model(name: 'Unresponsive hostel administration'),
          ComplaintLevel3Model(name: 'Security or privacy concerns in the hostel'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),
  // Infrastructure Complaints
  ComplaintCategoryModel(
    name: 'Infrastructure',
    iconPath: 'assets/images/icons/infrastructure.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Building & Facilities',
        level3Categories: [
          ComplaintLevel3Model(name: 'Poor maintenance (leakages, cracks, broken windows)'),
          ComplaintLevel3Model(name: 'Inaccessible facilities (ramps, elevators)'),
          ComplaintLevel3Model(name: 'Broken equipment in classrooms/labs'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Restrooms',
        level3Categories: [
          ComplaintLevel3Model(name: 'Unsanitary conditions'),
          ComplaintLevel3Model(name: 'Lack of essential supplies (tissue, soap)'),
          ComplaintLevel3Model(name: 'Damaged restroom facilities'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Cafeteria',
        level3Categories: [
          ComplaintLevel3Model(name: 'Poor food quality'),
          ComplaintLevel3Model(name: 'Lack of hygiene'),
          ComplaintLevel3Model(name: 'Overcrowding'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Campus Grounds',
        level3Categories: [
          ComplaintLevel3Model(name: 'Poor landscaping or cleanliness'),
          ComplaintLevel3Model(name: 'Water logging issues'),
          ComplaintLevel3Model(name: 'Inadequate outdoor seating or shelter'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),
  // Technology & IT Complaints
  ComplaintCategoryModel(
    name: 'Technology & IT',
    iconPath: 'assets/images/icons/technology.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Wi-Fi/Internet',
        level3Categories: [
          ComplaintLevel3Model(name: 'Connectivity issues'),
          ComplaintLevel3Model(name: 'Limited access to student Wi-Fi'),
          ComplaintLevel3Model(name: 'Frequent disconnections'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Learning Management System (LMS)',
        level3Categories: [
          ComplaintLevel3Model(name: 'Issues accessing the LMS'),
          ComplaintLevel3Model(name: 'Content not uploaded by instructors on time'),
          ComplaintLevel3Model(name: 'Technical glitches during online assessments'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Online Portals',
        level3Categories: [
          ComplaintLevel3Model(name: 'Glitches in student portals'),
          ComplaintLevel3Model(name: 'Password recovery or account issues'),
          ComplaintLevel3Model(name: 'Slow performance during peak usage times'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Computer Labs',
        level3Categories: [
          ComplaintLevel3Model(name: 'Outdated hardware/software'),
          ComplaintLevel3Model(name: 'Unavailability of computers'),
          ComplaintLevel3Model(name: 'Printer/scanner malfunctions'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),
  // Disciplinary Complaints
  ComplaintCategoryModel(
    name: 'Discipline & Conduct',
    iconPath: 'assets/images/icons/discipline.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Student Misconduct',
        level3Categories: [
          ComplaintLevel3Model(name: 'Bullying or harassment'),
          ComplaintLevel3Model(name: 'Cheating or academic dishonesty'),
          ComplaintLevel3Model(name: 'Substance abuse (drugs, alcohol)'),
          ComplaintLevel3Model(name: 'Disruptive behavior in classes or campus events'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Staff Misconduct',
        level3Categories: [
          ComplaintLevel3Model(name: 'Discrimination or bias'),
          ComplaintLevel3Model(name: 'Harassment or unprofessional behavior'),
          ComplaintLevel3Model(name: 'Inappropriate communication or language'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Dress Code Violations',
        level3Categories: [
          ComplaintLevel3Model(name: 'Non-compliance with college dress code'),
          ComplaintLevel3Model(name: 'Inappropriate clothing during campus activities'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Behavioral Issues in Campus Facilities',
        level3Categories: [
          ComplaintLevel3Model(name: 'Misuse of shared spaces (cafeteria, library, labs)'),
          ComplaintLevel3Model(name: 'Vandalism or damage to college property'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),

  // Extracurricular Activities Complaints
  ComplaintCategoryModel(
    name: 'Extracurricular Activities',
    iconPath: 'assets/images/icons/extracurricular.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Sports Facilities',
        level3Categories: [
          ComplaintLevel3Model(name: 'Poor maintenance of sports equipment'),
          ComplaintLevel3Model(name: 'Inadequate availability of facilities'),
          ComplaintLevel3Model(name: 'Issues with coaching or training quality'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Clubs and Societies',
        level3Categories: [
          ComplaintLevel3Model(name: 'Lack of funding or resources'),
          ComplaintLevel3Model(name: 'Unclear guidelines for club membership'),
          ComplaintLevel3Model(name: 'Limited variety in club activities'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Events and Competitions',
        level3Categories: [
          ComplaintLevel3Model(name: 'Poor event organization'),
          ComplaintLevel3Model(name: 'Insufficient advertisement of events'),
          ComplaintLevel3Model(name: 'Issues with event scheduling'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),
  // Health and Safety Complaints
  ComplaintCategoryModel(
    name: 'Health & Safety',
    iconPath: 'assets/images/icons/health.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Medical Services',
        level3Categories: [
          ComplaintLevel3Model(name: 'Unavailability of on-campus medical staff'),
          ComplaintLevel3Model(name: 'Inadequate emergency facilities'),
          ComplaintLevel3Model(name: 'Insufficient medication or equipment'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Sanitation and Hygiene',
        level3Categories: [
          ComplaintLevel3Model(name: 'Poor campus cleanliness'),
          ComplaintLevel3Model(name: 'Lack of hand sanitizers'),
          ComplaintLevel3Model(name: 'Inadequate waste disposal systems'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Fire and Safety',
        level3Categories: [
          ComplaintLevel3Model(name: 'Absence of fire extinguishers or alarms'),
          ComplaintLevel3Model(name: 'Blocked emergency exits'),
          ComplaintLevel3Model(name: 'Lack of safety drills'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Environmental Concerns',
        level3Categories: [
          ComplaintLevel3Model(name: 'Pollution within campus (air, noise)'),
          ComplaintLevel3Model(name: 'Uncontrolled campus littering'),
          ComplaintLevel3Model(name: 'Lack of recycling options'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),
  // Financial Aid & Scholarships Complaints
  ComplaintCategoryModel(
    name: 'Scholarships & Financial Aid',
    iconPath: 'assets/images/icons/scholarships.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Scholarship Availability',
        level3Categories: [
          ComplaintLevel3Model(name: 'Limited scholarship opportunities'),
          ComplaintLevel3Model(name: 'Lack of information on available scholarships'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Financial Aid Processing',
        level3Categories: [
          ComplaintLevel3Model(name: 'Delays in financial aid processing'),
          ComplaintLevel3Model(name: 'Eligibility criteria issues'),
          ComplaintLevel3Model(name: 'Incorrect disbursement amounts'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Tuition Fee Waivers',
        level3Categories: [
          ComplaintLevel3Model(name: 'Lack of clear policies on fee waivers'),
          ComplaintLevel3Model(name: 'Confusion on eligibility requirements'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),
  // Cultural and Diversity Complaints
  ComplaintCategoryModel(
    name: 'Diversity & Inclusion',
    iconPath: 'assets/images/icons/diversity.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Discrimination',
        level3Categories: [
          ComplaintLevel3Model(name: 'Racial discrimination'),
          ComplaintLevel3Model(name: 'Religious discrimination'),
          ComplaintLevel3Model(name: 'Gender-based discrimination'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Lack of Diversity',
        level3Categories: [
          ComplaintLevel3Model(name: 'Limited representation in campus events'),
          ComplaintLevel3Model(name: 'Inadequate support for minority groups'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Cultural Insensitivity',
        level3Categories: [
          ComplaintLevel3Model(name: 'Insensitive language or content'),
          ComplaintLevel3Model(name: 'Lack of respect for cultural practices'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),
 // Environmental Concerns
  ComplaintCategoryModel(
    name: 'Environmental',
    iconPath: 'assets/images/icons/environment.png',
    subCategories: [
      ComplaintSubCategoryModel(
        name: 'Campus Sustainability',
        level3Categories: [
          ComplaintLevel3Model(name: 'Lack of recycling initiatives'),
          ComplaintLevel3Model(name: 'Excessive use of plastic materials'),
          ComplaintLevel3Model(name: 'Energy wastage on campus'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Green Spaces',
        level3Categories: [
          ComplaintLevel3Model(name: 'Insufficient green areas on campus'),
          ComplaintLevel3Model(name: 'Poor maintenance of plants and landscaping'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Air and Noise Pollution',
        level3Categories: [
          ComplaintLevel3Model(name: 'Air pollution from nearby industries'),
          ComplaintLevel3Model(name: 'Noise pollution due to construction'),
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
      ComplaintSubCategoryModel(
        name: 'Other',
        level3Categories: [
          ComplaintLevel3Model(name: 'Other'),
        ],
      ),
    ],
  ),
  ComplaintCategoryModel(
    name: 'Others Complaints',
    iconPath: 'assets/images/icons/others.png',
    subCategories: [ComplaintSubCategoryModel(
        name: 'Others',
        level3Categories: [
          ComplaintLevel3Model(name: 'Others'),
        ],
      ),]

  ),
];
