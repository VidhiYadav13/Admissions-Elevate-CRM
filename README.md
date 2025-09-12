# Admissions-Elevate-CRM

# Phase 1: Problem Understanding & Industry Analysis

1. Problem Statement
University admissions departments are tasked with managing thousands of prospective students from diverse channels like college fairs, online inquiries, and high school partnerships. They often rely on legacy systems, spreadsheets, and manual processes, which create significant challenges:

Data Silos: Applicant information is scattered, making it impossible for recruiters and admissions officers to have a unified view of a candidate's journey.

Inconsistent Communication: Prospective students receive generic, impersonal communication, which fails to nurture their interest effectively.

Inefficient Review Process: The application review process is often manual, involving emailing files between reviewers, leading to delays and a lack of clear status tracking.

Limited Insight: It is difficult to track the effectiveness of recruitment events or marketing campaigns, making it hard to allocate resources effectively.

Edu-Ignite SFDC will provide a centralized platform to manage the entire student lifecycle, automate workflows, and provide data-driven insights to boost enrollment.

2. Requirement Gathering
Recruitment Management: Track interactions with prospective students from various recruitment events (Campaigns).

Applicant Portal: A branded community for applicants to submit their applications, upload documents (transcripts, essays), and check their status in real-time.

Application Management: A custom object to manage Applications with distinct stages (e.g., Submitted, Under Review, Awaiting Decision, Accepted, Declined).

Document Management: A secure way to manage and associate application-related documents with the applicant's record.

Reviewer Assignment: A system to automatically assign applications to the appropriate admissions officers or faculty reviewers based on program of interest or region.

Automated Communication: Email automation to confirm application receipt, notify of missing documents, and communicate final decisions.

Reporting & Analytics: Dashboards to monitor application volume, recruitment channel effectiveness, and enrollment funnels.

3. Stakeholder Analysis
Admissions Officers/Recruiters: Need a system to manage their pipeline of prospective students, log interactions, and efficiently move candidates through the funnel.

Application Reviewers (Faculty/Staff): Need a simple, streamlined interface to view application details, read documents, and submit their reviews/scores.

Admissions Director: Needs high-level dashboards to track team performance, forecast enrollment numbers, and analyze recruitment ROI.

Prospective Students (Applicants): Need a user-friendly portal to manage their application and receive clear, timely updates on their status.

4. Business Process Mapping
As-Is (Current) Process:
A recruiter collects student info on a clipboard at a college fair.

The data is manually entered into an Excel spreadsheet back at the office.

A generic follow-up email is sent to the list of students from that fair.

A student submits an application via a third-party portal, and the data is downloaded as a CSV.

The admissions coordinator manually collates the application PDF and supporting documents and emails them to a faculty reviewer.

The reviewer emails their feedback. The coordinator manually updates the status in the main spreadsheet.

A decision letter is manually mail-merged and emailed to the applicant.

To-Be (Future Salesforce) Process:
A recruiter uses the Salesforce mobile app to create Lead records in real-time at a college fair, adding them to a Campaign.

An automated email journey is triggered, sending targeted information based on the student's declared major interest.

The student registers and applies via an Experience Cloud portal, which creates a Contact record and a related Application record.

A flow automatically assigns the Application to a queue of reviewers based on the program selected.

The reviewer logs into Salesforce, views the application and all related documents in one place, and updates the review status.

Once all reviews are complete, a final decision is recorded. This automatically triggers an email to the applicant and updates their portal status.

5. Industry-specific Use Case Analysis
Program-Specific Requirements: Different academic programs (e.g., Engineering vs. Arts) have different application requirements and review criteria. This can be managed using record types and dynamic forms on the Application object.

Scholarship Management: The system could be extended to manage scholarship applications, awards, and donor reporting.

International Student Processing: International applicants have unique requirements (e.g., visa status, language proficiency tests). The system needs to capture and validate this specific information.

6. AppExchange Exploration
FormAssembly or Formstack: For creating complex, dynamic application forms that integrate seamlessly with Salesforce.

Conga or Nintex DocGen: For generating highly formatted offer letters and other official documents.

TargetX or other Education-focused CRMs: While building custom is the goal, analyzing these provides insight into best practices and common data models in the higher-ed space.

SMS Magic or Mogli SMS: For engaging with prospective students via text messaging, which is a highly effective channel for this demographic.
