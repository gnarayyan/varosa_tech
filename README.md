# varosa_tech

A new Flutter project for evaluation exam in varosa technology

## Initial Thought
- Instead of making 5 different apps, I'll make a signgle app. So, all 5 apps can be navigated from 1st screen. This will help me to not waste time in creating project, installing dependencies, etc. Also it may help evaluator to examine a single codebase and single app
- First I'll make app compatible for android then run on ios emulator and make compatible for ios too
- If time avilable, I'll work on other things like themes,..,etc
- In code the folder structure I'll follow is:
```
lib/
    apps/
        offline_todo/
        dynamic_form/
        mini_ecommerce/
        method_channel/
        nested_bottom_nav/
    themes/
    core/
    common/

```
- Each folder will follow own architecture & pattern (to meet evaluation criteria) but if some logic is sharable like themes, components, it will be shared from common, core or themes folder. Please don't consider it as anti pattern(I will take this liberty for my easiness (i.e. reusability) )


## Development Environemnt
Flutter: 3.32.7 
Dart: 3.8.1
OS: Ubuntu 24.04.2 LTS
IDE: VS Code
