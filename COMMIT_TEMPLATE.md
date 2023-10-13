commit e9b7a7d9e897ae175ed3735c74706012e1511404
Author: Developer Name <developer@til-dev.com>
Date:   Wed Jun 7 16:37:26 2023 -0500

  This is an example commit title

  After the title and a blank line, we can explain why we are
  writing this code. Why is the most important thing to explain,
  but you might include what specifically changed, especailly the
  behavior that was changed. This may be a paragraph, a set of
  bullet points, or a mix of both. The last line should include
  [finishes, fixes, delivers] followed by the id of the card in
  Pivotal Tracker. This connects the commit to a specific card.
  If it is an incremental commit, just include the id of the card
  without a keyword.

  - Remember to include why your are making the change.
  - Always include the card id in the last line.
  - Use short concsise titles that summarize the change.

  finishes #github_issue

----------
Other resources about writing commit messages:
- [Writing good commit messages a practical guide](https://www.freecodecamp.org/news/writing-good-commit-messages-a-practical-guide/)
- [A note about git commit messages](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)

----------
Realworld Examples:

commit 8e0c10d740b9a78fe5f6b788d2e6ed114846b36a
Author: JuanequeX <juanequex@til-dev.com>
Date:   Thu May 25 22:08:33 2023 +0000

  Fix scavenger hunts in the chatbot

  The chatbot relies on the resource 'kind' to present scavenger
  hunts. Pass the type as the 'kind' in the resource object sent
  to the chatbot. Downcase since it is displayed in the middle of
  a sentence.

  issue #1234567

commit 00eed80430fb4cd559fcdb4f82b03a0bb765358c
Author: JuanequeX <juanequex@til-dev.com>
Date:   Fri May 26 12:32:58 2023 -0400

  Disable scavenger hunt button and display time left in tooltip

  Remove the review modal for a recently completed scavenger hunt.
  Instead disable the "Study now" button and show a tooltip on hover
  with "Try again in x days". This matches our style on the learning
  dashboard when a learner locks a skill.

  issue #12345
