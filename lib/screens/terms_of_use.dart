import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TermsOfUseScreenState createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUse> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Terms of Use"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              createContainer(
                  context,
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1. INTRODUCTION",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "Welcome to  <weblink> (the “Website“) & iOS Android App. The Website is owned and operated by OWA Holdings, Inc. (“Oneness USA CANADA”).\nPLEASE READ THESE TERMS OF USE CAREFULLY BEFORE USING THE WEBSITE / APP. By using the Website / App, you signify your agreement to these Terms of Use. If you do not agree to these Terms of Use, you may not use the Website. In addition, when you use any of our current or future services, you will also be subject to our guidelines, terms, conditions and agreements applicable to those services. If these Terms of Use are inconsistent with the guidelines, terms and agreements applicable to those services, these Terms of Use will control.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "2. PRIVACY AND YOUR ACCOUNT",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "Please review our Privacy Policy, which also governs your visit to the Website, to understand our privacy practices.\nWe may sell products for children, but sell them to adults who can purchase with a credit card or other permitted payment method. If you are under 18, you may use the Website only with the involvement of a parent or guardian. We reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "3. CONSIDERATION",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "You agree that these Terms of Use are supported by reasonable and valuable consideration, the receipt and adequacy of which you hereby acknowledge, including, without limitation, your access to and use of the Website and data, materials and information available at or through the Website.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "4. RESTRICTIONS ON USE; LIMITED LICENSE",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "All content contained on the Website / App (collectively, “Content“), such as text, graphics, logos, icons, images, audio and video clips, digital downloads, data compilations, and software, is our property or the property of our licensors or licensees, and the compilation of the Content on the Website is our exclusive property, protected by United States and international copyright laws, treaties and conventions. All software used on the Website is our property or the property of our software suppliers and protected by United States and international copyright laws, treaties and conventions.\nAny trademarks, service marks, graphics, logos, page headers, icons, scripts and trade names (each, a “Mark“) contained on the Website are proprietary to us or our licensors or licensees. Our Marks may not be used in connection with any product or service that is not ours in any manner that is likely to cause confusion among users or that disparages or discredits us or anyone else. All other Marks not owned by us that appear on the Website are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by us.\nWe grant you a limited license to access and make personal use of the Website / App. No Content of the Website / App or any other Internet site owned, operated, licensed, or controlled by us may be copied, reproduced, republished, downloaded (other than page caching), uploaded, posted, transmitted or distributed in any way, or sold, resold, visited, or otherwise exploited for any commercial purpose, except that you may download one (1) copy of the Content that we make available to you for such purposes on a single computer for your personal, noncommercial, home use only, provided that you: (a) keep intact all copyright, trademark and other proprietary rights notices; (b) do not modify any of the Content; (c) do not use any Content in a manner that suggests an association with any of our products, services or brands; and (d) do not download Content so as to avoid future downloads from the Website. Your use of Content on any other website or computer environment is strictly prohibited.\nThe license granted to you does not include, and specifically excludes, any rights to: resell or make any commercial use of the Website or any Content; collect and use any product listings, descriptions, or prices; make any derivative use of the Website or Content; download or copy account information for the benefit of anyone else; or use any form of data mining, robots, or similar data gathering and extraction tools. You may not frame, or utilize framing techniques to enclose, any Mark, Content or other proprietary information, or use any meta tags or any other “hidden text” utilizing any such intellectual property, without our and each applicable owner’s express written consent. Any unauthorized use automatically terminates the license granted to you hereunder. You are granted a limited, revocable, and non-exclusive right to create a hyperlink only to our home page provided that the link does not portray us or our licensors or licensees, or their respective products or services, in a false, misleading, derogatory, or otherwise offensive matter. You may not use any of our or any such party’s intellectual property as part of the link without our and each such party’s express written consent.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "5. USE AND PROTECTION OF PASSWORD AND ID.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "Oneness USA CANADA will assign a password and account ID to you so you can access and use certain areas of the Website. Each user who uses such assigned password and ID shall be deemed to be authorized by you to access and use the Website, and Oneness USA CANADA shall have no obligation to investigate the authorization or source of any such access or use.\nYOU ACKNOWLEDGE AND AGREE THAT AS BETWEEN YOU AND Oneness USA CANADA, YOU WILL BE SOLELY RESPONSIBLE FOR ALL ACCESS TO AND USE OF THE WEBSITE BY ANYONE USING THE PASSWORD AND ID ASSIGNED TO YOU WHETHER OR NOT SUCH ACCESS TO AND USE OF THE WEBSITE IS ACTUALLY AUTHORIZED BY YOU, INCLUDING ALL COMMUNICATIONS AND TRANSMISSIONS AND ALL OBLIGATIONS (INCLUDING FINANCIAL OBLIGATIONS FOR PURCHASES THROUGH THE WEBSITE) THAT MAY RESULT FROM SUCH ACCESS OR USE.\nYou are solely responsible for protecting the security and confidentiality of the password and ID assigned to you. You shall immediately notify Oneness USA CANADA of any unauthorized use of the assigned password or ID, or any other breach or threatened breach of the Website’s security of which you are aware. You will be responsible for any activity conducted under your assigned password or ID.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "6. SYSTEM REQUIREMENTS.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "Use of the certain areas of the Website requires Internet access, audio manager software or other software allowing the downloading and storing of audio and audio-visual files in MP3 or other digital format (the “Software“), and, for certain downloadable content, a compatible player device (the “Device“).Oneness USA CANADA may, at any time and from time to time, in its sole discretion, modify, revise, or otherwise change the system requirements for the Website and the format of any downloadable content, in whole or in part, without notice or liability to you.\nInternet access, use of the Software, or use of a Device may result in fees in addition to any fees incurred on the Website. Software and Devices may require you to obtain updates or upgrades from time to time. Your ability to use the Website may be affected by the performance of the Software, the Device, or your Internet connection. You acknowledge and agree that it is your sole responsibility to comply with the system requirements of your Software and Device, as in effect from time to time, and to maintain, update, and upgrade your Software and Devices, including the payment of all Internet access, Software, and Device fees without recourse to Oneness USA CANADA.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "7. SUBMISSIONS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "You may post reviews, comments, photographs, and other content; send communications; and submit suggestions, ideas, comments, questions, or other information, so long as none of these materials are illegal, obscene, threatening, defamatory, invasive of privacy, infringing on intellectual property rights, or otherwise injurious to third parties or objectionable and do not consist of or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings, or any form of “spam.” You may not use a false e-mail address, impersonate anyone, or otherwise mislead as to the origin of any content. We reserve the right (but not the obligation) to remove or edit any such content, but we do not regularly review posted content.\nPlease do not send us any material that you do not intend to be subject to the User-Generated Content License described in this paragraph. All content described in the immediately preceding paragraph and any and all other information, content or materials that you post or send to us hereinafter collectively is referred to as “User-Generated Content.” If you post or send any User-Generated Content to us, intentionally or unintentionally, we (and such others as we may designate from time to time) shall have the unrestricted rights to the use thereof for any and all purposes whatsoever, commercial or otherwise, without any further permission from, or any payment to, you or anyone else. We and our designees also shall have the right (but no obligation) to use the name that you submit, as well as any other name by which you are or may be known, in connection with User-Generated Content. Without limiting the generality of the foregoing, you hereby unconditionally grant to us a perpetual, non-exclusive, irrevocable, fully-paid, royalty-free, sub-licensable and transferable universal license to use, re-use, reproduce, transmit, print, publish, display, exhibit, distribute, re-distribute, copy, host, store, cache, archive, index, categorize, comment on, broadcast, stream, download, edit, alter, modify, adapt, translate, create derivative works based upon and publicly perform User-Generated Content, in whole or in part, by all means and in all media now known or hereafter devised for any and all purposes without further notice to you and with or without attribution (the “User-Generated Content License“). You agree to the User-Generated Content License whether or not your User-Generated Content is used by us.\nYou represent, warrant and agree that: you own or otherwise control all of the rights to all User-Generated Content that you post or send to us; that all such User-Generated Content is accurate; use of such User-Generated Content does not violate these Terms of Use, our Privacy Policy or the rights of any third party and will not cause injury to anyone; and you will indemnify us and our affiliates and designees from and against all claims arising out of, resulting from or relating to any such User-Generated Content. We have the right (but no obligation) to monitor, edit or remove any activity or content involving you. We have no responsibility, and assume no liability, for any User-Generated Content posted or sent by you or by anyone else.\nYou agree that User-Generated Content will not be subject to any expectation of trust or confidence between us and that no confidential or fiduciary relationship is intended or created between you and us. To the extent that any so-called “moral rights,” “neighboring rights” or similar or analogous rights apply to any User-Generated Content and which are not exclusively owned by us, you agree not to enforce or assign, or permit any third party to enforce or assign, any such rights.\nEach time that you access the Website, or post or submit User-Generated Content, you agree that the User-Generated Content License is ratified and confirmed with respect to such User-Generated Content and all User-Generated Content previously posted or submitted by you.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "8. CONTENT LINKED TO THE WEBSITE",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "You should be aware that when you visit the Website, you could be directed to other sites beyond our control including links to or from affiliates and content partners that may use our Marks as part of an affiliate relationship. When you click on a link that directs you away from the Website, the site to which you are directed may not be controlled by us and different terms of use and privacy policies may apply which you should carefully read and evaluate. You acknowledge that we are not responsible for examining or evaluating, and that we do not warrant the offerings of, any such third party or the content of their sites. We do not assume any responsibility or liability for the actions, products, or content of any third party or any third party site. We reserve the right to disable links from or to third-party sites, although we are under no obligation to do so.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "9. DISCLAIMER OF WARRANTIES",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "THE CONTENT ON THE WEBSITE IS PROVIDED “AS IS” AND WITHOUT WARRANTY OF ANY KIND, EXPRESSED OR IMPLIED. TO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, WE DISCLAIM ANY AND ALL WARRANTIES, EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. WE DO NOT WARRANT THAT THE FUNCTIONS CONTAINED IN ANY CONTENT (INCLUDING, WITHOUT LIMITATION, USER-GENERATED CONTENT) WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT THE WEBSITE OR THE SERVERS THAT MAKE SUCH CONTENT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS AND YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION OF ANY OF YOUR EQUIPMENT OR SOFTWARE. WE MAKE NO REPRESENTATIONS OR WARRANTIES REGARDING USE, OR THE RESULTS OF USE, OF ANY CONTENT, PRODUCT OR SERVICE CONTAINED ON OR OFFERED, MADE AVAILABLE THROUGH, OR OTHERWISE RELATED IN ANY WAY TO THE WEBSITE INCLUDING, WITHOUT LIMITATION, ANY THIRD PARTY SITE OR SERVICE LINKED TO FROM THE WEBSITE (AND SPECIFICALLY NO REPRESENTATION OR WARRANTY OF CORRECTNESS, ACCURACY, COMPLETENESS, RELIABILITY OR SAFETY).\nWE EXPLICITLY DISCLAIM ANY RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS OR AVAILABILITY OF INFORMATION, CONTENT AND MATERIALS FOUND ON SITES THAT LINK TO OR FROM THE WEBSITE. WE CANNOT ENSURE THAT YOU WILL BE SATISFIED WITH ANY PRODUCT OR SERVICE THAT YOU PURCHASE FROM A THIRD PARTY WEBSITE THAT LINKS TO OR FROM THE WEBSITE OR THIRD PARTY INFORMATION, CONTENT OR MATERIALS CONTAINED ON OUR WEBSITE. WE DO NOT ENDORSE ANY OF THE MERCHANDISE, NOR HAVE WE TAKEN ANY STEPS TO CONFIRM THE ACCURACY, COMPLETENESS OR RELIABILITY OF, ANY OF THE INFORMATION, CONTENT OR MATERIALS CONTAINED ON ANY THIRD PARTY WEBSITE. WE DO NOT MAKE ANY REPRESENTATIONS OR WARRANTIES AS TO THE SECURITY OF ANY INFORMATION, CONTENT OR MATERIALS (INCLUDING, WITHOUT LIMITATION, CREDIT CARD AND OTHER PERSONAL INFORMATION) YOU MIGHT BE REQUESTED TO GIVE TO ANY THIRD PARTY. YOU HEREBY IRREVOCABLY AND UNCONDITIONALLY WAIVE ANY AND ALL CLAIMS AGAINST US WITH RESPECT TO INFORMATION, CONTENT AND MATERIALS CONTAINED ON THE WEBSITE (INCLUDING, WITHOUT LIMITATION, USER-GENERATED CONTENT), ON THIRD PARTY SITES, AND ANY INFORMATION, CONTENT AND MATERIALS YOU PROVIDE TO OR THROUGH ANY SUCH THIRD PARTY SITES (INCLUDING, WITHOUT LIMITATION, CREDIT CARD AND OTHER PERSONAL INFORMATION). WE STRONGLY ENCOURAGE YOU TO MAKE WHATEVER INVESTIGATION YOU FEEL NECESSARY OR APPROPRIATE BEFORE PROCEEDING WITH ANY ONLINE OR OFFLINE TRANSACTION WITH ANY THIRD PARTY.\nTHE WEBSITE AND PRODUCTS/SERVICES CONTAINED THEREON ARE NOT SUBSTITUTES FOR THE ADVICE AND TREATMENT OF A LICENSED HEALTH CARE PROFESSIONAL. NOT ALL PRODUCTS AND SERVICES ARE SUITED FOR EVERYONE. THE CREATORS OF ANY PRODUCTS/SERVICES DO NOT ASSUME, AND SHALL NOT HAVE, ANY LIABILITY TO USERS FOR INJURY OR LOSS IN CONNECTION THEREWITH. WE MAKE NO REPRESENTATIONS OR WARRANTIES AND EXPRESSLY DISCLAIM ANY AND ALL LIABILITY CONCERNING ANY TREATMENT OR ANY ACTION FOLLOWING THE INFORMATION OFFERED OR PROVIDED WITHIN OR THROUGH THE WEBSITE. IF YOU HAVE SPECIFIC CONCERNS OR A SITUATION IN WHICH YOU REQUIRE PROFESSIONAL OR MEDICAL ADVICE, YOU SHOULD CONSULT WITH AN APPROPRIATELY TRAINED AND QUALIFIED SPECIALIST, SUCH AS A LICENSED PSYCHOLOGIST, PHYSICIAN OR OTHER HEALTH PROFESSIONAL. NEVER DISREGARD THE MEDICAL ADVICE OF A PSYCHOLOGIST, PHYSICIAN OR OTHER HEALTH PROFESSIONAL, OR DELAY IN SEEKING SUCH ADVICE, BECAUSE OF THE INFORMATION OFFERED OR PROVIDED WITHIN OR THROUGH THE WEBSITE.\nYOU ACKNOWLEDGE THAT YOU HAVE CAREFULLY READ THIS “WAIVER AND RELEASE” AND FULLY UNDERSTAND THAT IT IS A RELEASE OF LIABILITY. YOU EXPRESSLY AGREE TO RELEASE AND DISCHARGE ALL INDEMNIFIED PARTIES (AS DEFINED BELOW) FROM ANY AND ALL CLAIMS OR CAUSES OF ACTION AND YOU AGREE TO VOLUNTARILY GIVE UP AND IRREVOCABLY WAIVE AND RELEASE ANY RIGHT THAT YOU MAY OTHERWISE HAVE TO BRING A LEGAL ACTION AGAINST ANY INDEMNIFIED PARTY FOR PERSONAL INJURY OR PROPERTY DAMAGE.\nCERTAIN STATE LAWS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES. IF THESE LAWS APPLY TO YOU, SOME OR ALL OF THE FOREGOING DISCLAIMERS, EXCLUSIONS OR LIMITATIONS MAY NOT APPLY TO YOU, AND YOU MIGHT HAVE ADDITIONAL RIGHTS.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "10. INDEMNIFICATION",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "You hereby agree to indemnify, defend, and hold us, and our licensors, licensees, successors, distributors, agents, representatives and other authorized users, and each of their respective officers, directors, owners, managers, members, employees, agents, representatives and assigns (collectively, the “Indemnified Parties“), harmless from and against any and all loss, cost, damage, liability and expense (including, without limitation, settlement costs and legal or other fees and expenses) suffered or incurred by any of the Indemnified Parties arising out of, in connection with or related to any breach or alleged breach by you of these Terms of Use. You shall use your best efforts to cooperate with us in the defense of any claim. We reserve the right, at our own expense, to employ separate counsel and assume the exclusive defense and control of the settlement and disposition of any claim that is subject to indemnification by you.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "11. LIMITATION OF LIABILITY",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "UNDER NO CIRCUMSTANCES (INCLUDING NEGLIGENCE) SHALL WE BE LIABLE TO YOU OR ANYONE ELSE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES (INCLUDING LOST PROFITS), PERSONAL INJURY (INCLUDING DEATH) OR PROPERTY DAMAGE OF ANY KIND OR NATURE WHATSOEVER THAT ARISE OUT OF OR RESULT FROM: (A) THE USE OF, OR ANY INABILITY TO USE, THE WEBSITE OR ANY CONTENT OR FUNCTIONS THEREOF; OR (B) ANY ACT OR OMISSION, ONLINE OR OFFLINE, OF ANY USER OF THE WEBSITE OR ANYONE ELSE, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. IN NO EVENT SHALL OUR TOTAL LIABILITY TO YOU FOR ALL LOSS, COST, DAMAGE, LIABILITY OR EXPENSE (INCLUDING ATTORNEYS FEES AND COSTS) THAT YOU MAY SUFFER OR INCUR, UNDER ANY THEORY OF LIABILITY, IN CONTRACT, TORT (INCLUDING, BUT NOT LIMITED TO, NEGLIGENCE) OR OTHERWISE, EXCEED THE LESSER OF THE AMOUNT PAID BY YOU, IF ANY, FOR THE RIGHT TO ACCESS OR PARTICIPATE IN ANY ACTIVITY RELATED TO THE WEBSITE OR \$100.00.\nUNDER NO CIRCUMSTANCES SHALL WE OR ANY OF THE INDEMNIFIED PARTIES BE LIABLE FOR ANY DELAY OR FAILURE IN PERFORMANCE RESULTING, DIRECTLY OR INDIRECTLY, FROM ANY EVENT OF FORCE MAJEURE OR OTHER CAUSE BEYOND OUR OR THEIR CONTROL INCLUDING, WITHOUT LIMITATION, ACTS OF GOD, WAR, EQUIPMENT AND TECHNICAL FAILURES, ELECTRICAL POWER FAILURES OR FLUCTUATIONS, STRIKES, LABOR DISPUTES, RIOTS, CIVIL DISTURBANCES, SHORTAGES OF LABOR OR MATERIALS, NATURAL DISASTERS, GOVERNMENTAL ACTIONS, ORDERS OF DOMESTIC OR FOREIGN COURTS OR TRIBUNALS, OR NON-PERFORMANCE OF THIRD PARTIES. NEITHER WE NOR ANY OTHER INDEMNIFIED PARTY IS RESPONSIBLE OR LIABLE FOR: (A) ANY INCOMPATIBILITY BETWEEN THE WEBSITE AND ANY SITE, SERVICE, SOFTWARE OR HARDWARE; OR (B) ANY DELAY OR FAILURE YOU MAY EXPERIENCE WITH ANY TRANSMISSION OR TRANSACTION RELATED TO THE WEBSITE.\nTHE LIMITATIONS, EXCLUSIONS AND DISCLAIMERS HEREIN AND ELSEWHERE IN THESE TERMS OF USE APPLY TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW.\nAPPLICABLE LAW MAY NOT ALLOW CERTAIN OF THE EXCLUSIONS, LIMITATIONS, OR DISCLAIMERS OF LIABILITY SET FORTH IN THESE TERMS OF USE, SO SUCH EXCLUSIONS, LIMITATIONS OR DISCLAIMERS MAY NOT APPLY TO YOU.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "12. COPYRIGHT COMPLAINTS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We respect the intellectual property rights of others. If you believe that your work has been copied on the Website in a way that constitutes copyright infringement, please follow our Notice and Procedure for Making Claims of Copyright Infringement.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "13. AMENDMENT",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We reserve the right, in our sole discretion, to change, modify, add or delete portions of these Terms of Use at any time without notice, and it is your responsibility to review these Terms of Use for any changes. Your use of the Website following any change to these Terms of Use will constitute your assent to and acceptance of the revised Terms of Use.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "14. TERMINATION",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "These Terms of Use are effective until terminated by either you or us. You may terminate these Terms of Use prospectively at any time by discontinuing your access to and use of the Website and destroying all materials obtained from the Website and all related documentation and all copies and installations thereof, whether made under these Terms of Use or otherwise. If you terminate these Terms of Use, you shall notify us by sending notice of such termination by certified UK mail, to:\nOWA Holdings, Inc.\n40 E Main St 1154\nNewark, Delaware 19711-4639\nUnited States\nWe may terminate these Terms of Use (including your access to and use of the Website) without cause and without notice to you, in our sole discretion. Upon termination, you must cease any access to or use of the Website and destroy all materials obtained from the Website and all related documentation and all copies and installations thereof, whether made under these Terms of Use or otherwise. We have adopted and implemented a policy that provides for the termination, in appropriate circumstances, of users who are repeat infringers of copyright.\nThe provisions of these Terms of Use, which by their nature should survive the termination of these Terms of Use, shall survive such termination.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "APPLICABLE LAW AND DISPUTES",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "These Terms of Use, your rights and obligations, our rights and obligations, and all actions contemplated by these Terms of Use, will be governed by the laws of the United States of America and the State of California, without regard to principles of conflicts of law and as if these Terms of Use were a contract wholly entered into and wholly performed within the State of California. These Terms of Use will not be governed by the United Nations Convention on Contracts for the International Sale of Goods.\nAny dispute relating in any way to your visit to the Website or to products you purchase through the Website shall be submitted to confidential binding arbitration in Los Angeles County, California, United States of America, except that, to the extent you have in any manner violated or threatened to violate our intellectual property rights, we may seek injunctive or other appropriate relief in any state or federal court in Los Angeles County, California, United States of America, and you consent to exclusive jurisdiction and venue in such courts.\nArbitration under these Terms of Use shall be conducted under the rules then prevailing of JAMS/ENDISPUTE Streamlined Arbitration Rules and Procedures in effect at the time of filing of the demand for arbitration.\nThe arbitrator’s award shall be binding and may be entered as a judgment in any court of competent jurisdiction. To the fullest extent permitted by applicable law, no arbitration under these Terms of Use shall be joined to an arbitration involving any other party subject to these Terms of Use, whether through class arbitration proceedings or otherwise.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "16. ELECTRONIC COMMUNICATIONS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "When you visit the Website or send e-mails to us, you are communicating with us electronically. You consent to receive communications from us electronically. We will communicate with you by e-mail or by posting notices on the Website. You agree that all agreements, notices, disclosures and other communications that we provide to you electronically satisfy any legal requirement that such communications be in writing.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "17. MISCELLANEOUS LEGAL PROVISIONS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We may discontinue the Website at any time and for any reason, without notice. We may change the contents, operation, or features of the Website at any time for any reason, without notice.\nYou agree that no joint venture, partnership, employment, or agency relationship exists between you and us as a result of these Terms of Use or your use of the Website. Nothing contained in these Terms of Use is in derogation of our right to comply with governmental, court, and law enforcement requests or requirements relating to your use of the Website or information provided to or gathered by us with respect to such use. A printed version of these Terms of Use and of any notice given in electronic form shall be admissible in judicial or administrative proceedings based upon or relating to these Terms of Use to the same extent and subject to the same conditions as other business documents and records originally generated and maintained in printed form.\nOur failure to enforce any provision of these Terms of Use or respond to a breach by you or others shall not constitute a waiver of our right to enforce any other provision of these Terms of Use as to that breach or any other.\nIf any provision of these Terms of Use is invalid or unenforceable under applicable law, the remaining provisions will continue in full force and effect, and the invalid or unenforceable provision will be deemed superseded by a valid, enforceable provision that most closely matches the intent of the original provision.\nThese Terms of Use constitute the entire agreement between you and us regarding the Website and supersedes any prior or contemporaneous agreement regarding that subject matter.\nUpdated October 2023",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "NOTICE AND PROCEDURE FOR MAKING CLAIMS OF COPYRIGHT INFRINGEMENT",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "If you believe that your work has been copied in a way that constitutes copyright infringement, please provide our copyright agent the written information specified below. Please note that this procedure is exclusively for notifying us that your copyrighted material has been infringed.\nAn electronic or physical signature of the person authorized to act on behalf of the owner of the copyright interest\nA description of the copyrighted work that you claim has been infringed\nA description of where the material that you claim is infringing is located on the Website\nYour address, telephone number, and e-mail address\nA statement by you that you have a good-faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law\nA statement by you, under penalty of perjury, that the foregoing information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf\nThe Oneness USA CANADA Copyright Agent for notice of claims of copyright infringement on the Website can be reached as follows:\nEKAM USA CANADA,\nAttn: Andrew R Klayman\n7582, Mulholland Drive,\nLos Angeles, California – 90046",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
