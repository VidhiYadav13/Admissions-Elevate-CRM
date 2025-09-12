# Admissions-Elevate-CRM: A Salesforce Student Recruitment Platform

A comprehensive Salesforce solution designed to streamline student recruitment, simplify the admissions process, and enhance applicant engagement for higher education institutions. This project replaces manual processes and data silos with a single source of truth.

Project Status: In Progress. Phase 1 is complete, and Phase 2 has been initiated.

## Phase 1: Problem Understanding & Industry Analysis (Completed)
   This initial phase focused on defining the project's scope, goals, and strategic approach.

1. Requirement Gathering
The core requirements for the platform have been identified:

Recruitment Management: A system to track interactions with prospective students from various events (e.g., college fairs, webinars).

Application Management: A dedicated system to manage applications through distinct stages (e.g., Submitted, Under Review, Accepted, Declined).

Document Management: Securely associate application documents (transcripts, essays) with an applicant's record.

Automated Communication: A mechanism for sending automated emails to confirm application receipt, notify of missing documents, and communicate final decisions.

Reporting & Analytics: Dashboards to monitor application volume, recruitment channel effectiveness, and enrollment funnels.

2. Stakeholder Analysis
The key stakeholders and their primary needs have been defined:

Admissions Officers/Recruiters: Need a system to manage their pipeline of prospective students and log interactions.

Application Reviewers (Faculty/Staff): Need a simple interface to view application details and submit their reviews.

Admissions Director: Needs high-level dashboards to track team performance and forecast enrollment.

Prospective Students (Applicants): Need a way to receive clear, timely updates on their application status.

3. Business Process Mapping
As-Is Process: The current process relies on disconnected spreadsheets, manual data entry from recruitment events, and an inefficient application review process conducted over email.

To-Be Process: The future state in Salesforce will involve automated lead capture, a structured application object, automated assignment of reviews, and triggered email communications to applicants.

4. Industry-specific Use Case Analysis
Key use cases for higher education have been considered:

Program-Specific Requirements: The system must handle different application requirements for various academic programs (e.g., Engineering vs. Arts).

Scholarship Management: The platform could be extended to manage scholarship applications and awards.

International Student Processing: The system will need to capture unique information for international applicants (e.g., visa status, language proficiency scores).

5. AppExchange Exploration
Potential AppExchange solutions have been researched to accelerate development:

FormAssembly or Formstack: For creating complex, dynamic application forms.

Conga or Nintex DocGen: For generating highly formatted offer letters.

SMS Magic or Mogli SMS: For engaging with prospective students via text messaging.

Phase 2: Org Setup & Configuration (In Progress)
This phase involves configuring the foundational settings of the Salesforce environment.

Completed Tasks:
Salesforce Edition: A Developer Edition org has been chosen for this project.

Dev Org Setup: A new, dedicated Developer Org has been successfully created.

Deployment Basics: The Developer Org has been connected to a local Visual Studio Code project, and the initial project structure has been committed to the Git repository.

Pending Tasks for this Phase:
Configure Company Profile, Business Hours, and Fiscal Year settings.

Set up the User model, including Profiles, Roles, and initial Permission Sets.

Define the Organization-Wide Defaults (OWD) and Sharing Rules for the core objects.

Next Steps
The immediate next step is to complete the remaining tasks in Phase 2. Once the foundational org setup is complete, the project will move into Phase 3: Data Modeling & Relationships, which will involve creating the custom objects (Application__c, Review__c, etc.) and their fields in Salesforce.
