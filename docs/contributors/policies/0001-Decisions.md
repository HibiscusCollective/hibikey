# POL-0001 Decision Making Process

**Author:** Pierre Fouilloux (@pfouilloux)

![Accepted](https://img.shields.io/badge/status-accepted-green)
![Date](https://img.shields.io/badge/Date-07_Feb_2025-lightblue)

## Context and Problem Statement

In an asynchronous work environment with contributors from across the planet, it can be difficult to form a consensus.
We also run the risk of inadventertently marginalising contributors outside time zones where the project is most active.

The aim of this policy is to provide a collaborative, inclusive and transparent process for making decisions.
We want a diverse community of contributors to feel welcome, heard, and safe to voice their opinions and ideas.

## Effective date

This policy will come into effect once there is enough community activity for it to be meaningful.

## Scope

This policy applies to major technology, policy, process and organizational decisions.
These are decisions that have a significant impact on the shape of the project's operations and governance.

As a rule of thumb, if it can be easily rolled back or reverted, we probably don't need to invoke this process.
Ex:

- *Doesn't need a decision record:* refactoring a specialised function into a generalised one that can be reused.
- *Needs a decision record:* replacing the logging framework in the libraries.
- *Doesn't need a decision record:* fixing a bug that causes connections to be improperly closed.
- *Needs a decision record:* adding a feature to automatically renew expired credentials in certain conditions.

Please don't hesitate to ask if you're not sure.
Just post something in a discussion, or reach out through discord once we've got that set up.

## Framework

1. All major decisions up for discussion will be publicly accessible and anyone is free to comment on them, excepting when clauses 4, 5 or 8 apply.
2. The discussion will remain open for a reasonable amount of time to allow all contributors to participate, excepting where clause 8 is invoked.
3. Once a decision is finalised it will be recorded in a publicly accessible registry in the project.
Ex: an architecture decision would go in the [ADR registry](/docs/contributors/decisions), but a policy decision would go in the [policies registry](/docs/contributors/policies).
4. Discourse and debate is encouraged, but must remain respectful and constructive.
Access to discussions may be constrained if deemed necessary to keep the discussions on track.
**I'd rather discussions stay free and open so please keep it civil.**
5. **We have a zero tolerance policy for hate speech, discrimination and intolerance**.
Any violations will result in an immediate ban and may be with or without warning.
The length of the ban will be based on the severity of the offense and the pattern of behaviour of the offender.
6. Once a decision has been made it will go through a probationary period.
During this period, it can be challenged, altered or overturned using a streamlined process.
7. After the probationary period is over a decision can only be overturned by raising another decision proposal for discussion.
8. In exceptional circumstances, I reserve the right to veto decisions or make decisions unilaterally without consultation.
Scenarios where I'd invoke this right include but aren't limited to:
    - Critical and/or time sensitive security incidents
    - If I have reason to believe a person may be in danger.
    - If the decision is time sensitive and critical to the continuation of the project.
    - If I can be personally held liable for the consequences of the decision by the nature of my position as project organizer.

## Process

1. **Status: backlog**. A question, problem, issue, etc is raised requiring a major decision.
This can be via any official channel of communication with the project.
It will be tracked as a github issue to follow the lifecycle of the process.
2. **Status: investigating**.
Whatever context we have on the problem and the decision we need to make will be posted in an open github discussion.
    - Anyone is invited and encouraged to add additional information or comments to enrich the context.
    **However the discussion is not the place to propose solutions**, these will be summarily removed.
    - Information provided must remain precise, factual and verifiable.
    Vague posts will be hidden and provided with the opportunity to improve.
    Proven falsehoods or misinformation will be removed.
    **Anyone spreading misinformation deliberately and/or repeatedly will be banned.**
    - A working group may be formed to deep dive into complex topics.
    A working group policy and code of conduct will be drafted when that becomes something we need.
    - The discussion will remain until the decision reaches *in review* status.
3. **Status: draft**. A branch will be created to track the decision with relaxed commenting/approval rules.
    - Any solution proposals must be submitted as a pull request to that branch.
    - These pull requests need not address the whole of the problem at once.
    It's absolutely encouraged to raise a small PR with an idea for just one part of the solution.
    - These PRs may be merged or rejected as the discussion evolves.
    **Closing your PR doesn't mean it was a bad idea or that we think badly of you.**
    It just may not be the right fit for this particular project or problem.
    - Permission to merge and close PRs will remain restricted to project maintainers.
    - Merging a PR with few comments or approvals must be justified in the merge message.
    - Closing a PR with few comments or many approvals must also be justified in the closing message.

4. **Status: in review**. Once the community is aligning on a single direction, a pull request will be raised to the main branch containing a draft decision record in MADR format [1].
It will remain open for comment for a reasonable amount of time and I will merge it when it is ready.
5. **Status: probation**. A decision will be moved to this status once it passes the initial review.
It will be merged into the decisions log at this time but the branch will remain open until the probation period is over.
    - During the probation period, any changes to the decision can be submitted as a PR to the decision branch.
    - This includes a proposal to reverse the decision if you feel that is warranted.
    - The idea is to streamline the challenge process before the decision becomes too entrenched.
6. **Status: approved**. After a variable amount of time based on the scope of the decision, the branch will be deleted.
Once the branch is gone, the decision may still be changed or reversed by starting the process anew.
    - In most cases we'll try to wait for open discussions to resolve before moving to this state.
    - Any open PRs to the branch will be automatically closed.
    - A best effort will be made to communicate the reasoning why any open conversations in the branch will be closed.

**Important note:** Any approved decision, policy, process, etc. is open to be challenged by anyone at any time.
We just start a new decision process about changing or reversing a previous decision.

## References

[1] Kopp, O. and Zimmermann, O. (2024). Markdown Architectural Decision Records (MADR). [online] MADR.
Architectural Decision Records Github Organization. Available at: <https://adr.github.io/madr/> [Accessed 6 Feb. 2025].
