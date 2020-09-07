#!/bin/bash 
# Shell script to automatically create markdown files for a new github repository
# Files added include:
#   * CHANGELOG.md 
#   * Pull Request Template
#   * Bug Template 
#   * Feature request Template 

# Write the CHANGELOG.md file
write_changelog (){
touch CHANGELOG.md
echo "# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security
" >> CHANGELOG.md
}

# Write the CONTRIBUTING.md file
write_contributing (){
touch CONTRIBUTING.md
echo "# Contributing
Hi there,

Thank you for taking interest in this project, and thank you for considering making a contribution to this project.

Contributions are certainly welcome here!

## Starting your contribution
When contributing to this repository, please first discuss the change you wish to make by creating an issue on the GitHub page:
* For bug reports [use this template]($URL/issues/new?assignees=$USERNAME&labels=bug&template=bug_report.md&title=).
* For feature requests [use this template]($URL/issues/new?assignees=$USERNAME&labels=enhancement&template=feature_request.md&title=).
* For questions [no template is required]($URL/issues/new?assignees=$USERNAME&labels=question), but please be as informative as possible.

## Pull Request Process
Once your contribution is ready to be added to the project, please do the following:
1. Ensure any install or build dependencies are removed before the end of the layer when doing a 
   build.
2. Ensure linting standards are conformed to.
3. If new code is written, ensure that unit tests have been writen to cover the new code.
4. Update the [changelog]($URL$/blob/develop/CHANGELOG.md). Add details of your update to the appropriate section beneath \"Unreleased\". Our changelogs are based on [KEEPACHANGELOG](https://keepachangelog.com/en/1.0.0/).
5. If required, update the [README](README.md) with details of changes to the interface.
6. Follow the Pull Request template. It is in place to make pull requests easier to review.
7. Assign $USERNAME as a reviewer.
8. You may merge the Pull Request to **DEVELOP**  once you have the sign-off of one other developer and all checks have passed.

## Running the tests
    <!-- Write instructions here on how to run the tests -->
" >> CONTRIBUTING.md
}

write_pr_template (){
touch .github/pull_request_template.md
echo "# Pull Request (PR) - *Enter Title Here*
## Description of Change

<!--
    Enter a description of your changes here.

    Perhaps write acceptance criteria in User Story manner such as the following:

    Give I am the owner of this repository,
    Then I would like a pull request template,
    So that pull requests can be better managed.

-->

## Link To Issue 

<!--
    Provide a link to the Issue on GitHub.
    If there is not an issue open write a reason why there is no issue open.
    Ideally PRs should all have issues so that appropriate discussions can be had prior to development / a PR being openned.
-->

## How to test this change

<!-- 
    Write a description of how this change can be tested by the reviewer of your PR
-->

## Checklists
### Checklist for developer of feature
- [ ] I have performed a code review on my own code
- [ ] I have written unit tests to test my code
- [ ] I have linked to the appropriate issue on GitHub
- [ ] I have written an appropriate description for this PR.
- [ ] I have written how to test this PR.
- [ ] I have updated the documentation (JSDoc / README etc.) where appropriate
- [ ] I have commented my code.
- [ ] I have updated the changelog.

### Checklist for reviewers
- [ ] I have reviewed the new code
- [ ] I have checked that new unit tests have been written
- [ ] I have ran the unit tests and they pass.
- [ ] I have followed the given steps to test the PR


" >> .github/pull_request_template.md
}

# Write bug report template
write_bug_report (){
    touch .github/ISSUE_TEMPLATE/bug_report.md
    echo "---
name: Bug found
about: Create a report to help us improve
title: ''
labels: 'bug'
assignees: <$USERNAME>

---

# Bug Report
## Description 
<!--
    A clear and concise description of what the bug is. 
    With as much information as possible!

    Remember the more information, the more the community can help.
 -->

## Steps To Reproduce The Bug
<!-- 
e.g. 
Steps to reproduce the behavior:
    1. Go to login page
    2. Click on forgot password
    3. Enter an unregistered email
    4. See error from the crash below

    Remember the more information, the more the community can help.
--> 

## Expected behavior
<!-- 
    A clear and concise description of what you expected to happen.

    Remember the more information, the more the community can help.
-->

## Screenshots / Error Logs
<!-- 
    If applicable, add screenshots or copies of the error logs to help explain your problem.
-->

## Please complete the following information:
 * Device: *[e.g. iOS, or specs of the comunity]*
 * OS: *[e.g. Windows 10, Ubuntu 19.04]*
 * Software Version: *[e.g. 1.0.2]*

## Additional information
<!-- 
    Add any other information about the problem here that may be useful
    Remember the more information, the more the community can help.
 -->
" >> .github/ISSUE_TEMPLATE/bug_report.md
}

write_feature_request_template (){
    touch .github/ISSUE_TEMPLATE/feature_request.md
    echo "---
name: Feature request
about: Request a feature for us to add
title: ''
labels: 'enhancement'
assignees: <$USERNAME>

---

# Feature Request - *Insert suggest feature name here*
## Describe the feature
<!-- 
    A clear and concise description of the feature.
-->

### Example user stories
<!-- 
    By adding some user stories, the feature is easier to test and analyse.

    e.g.

    As a <role>,
    I would like to be able to <capability>, 
    So that <receive benefit>
-->

## If this request is related to a problem, describe the problem
<!-- 
    A clear and concise description of what the problem is.
    I'm frustrated that / when [...] 
-->

## Alternate solutions to the problem
<!-- 
    A clear and concise description of any alternative solutions that would have the same effect.

    Please do some analysis of the alternate solutions and explain why they aren't best suited here.
-->

## Example implementations of similar features
<!--
    If possible, please show / link to some example implementations of the proposed feature or similar features.
-->

## Additional context
<!-- 
    Add any other information about the feature, such as screenshots / mockups / pseudocode may be useful to place here.
    
    Remember the more information, the more the community can help.
 -->
" >> .github/ISSUE_TEMPLATE/feature_request.md
}

USAGE="Usage: ./jing-templates.sh githubUsername repoURL"

if [ -z ${1} ] 
    then 
        echo "No argument set for USERNAME"
        echo $USAGE
        exit 1
    fi
if [ -z ${2} ] 
    then 
        echo "No argument set for URL"
        echo $USAGE
        exit 1
    fi
USERNAME=$1
URL=$2
cd $URL
write_changelog
write_contributing
mkdir -p .github/ISSUE_TEMPLATE
write_pr_template
write_bug_report
write_feature_request_template