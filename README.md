# How to work on yggdrasil
This is a guide on the basic steps of working on yggdrasil. Yggdrasil has some unique ways of working in comparison to most other design libraries. This guide will run you through the most important steps of adding something to yggdrasil.

### Definitions
Before getting in to how to work on yggdrasil we should first clarify some definitions as we use them in yggdrasil.
 - **States:** This usually refers to any visual state a widget, think of whether a button is pressed, hovered, focused, disabled, any sort of variants applied to the widget, sizes, etc. Any visual aspect of a widget which can change based on either user interactions or app-defined properties.


## Step 1: Finalize design.
Our designers will usually create a design for any new component before we start on implementing it. You can find these designs [here](https://www.figma.com/design/HXQfi18USxwbIBvUthxpuG/%F0%9F%8C%B3-Yggdrasil-Components?m=dev). Usually the component you need to implement is listed in the menu on the left side of the screen. In some cases however you might need to select a different branch to find the design.

Once you have found the design for the component you might be able to start working on the feature, however it's always good to check whether the designs cover all our bases before starting on the components. Some important things to check:
 - Does the widget have all required states? Some widgets don't have any visual states, however, most widgets do, or should. We should insure all states required for the widget are included in the design.
   - If the widget has some sort of interaction it can be focused, and should have a visually distinct state to indicate it is. Even if clicking it should not focus the widget, we still need to support focus for keyboard navigation.
   - If a widget can be pressed, it should most likely have a pressed state.
   - If it can be opened, it might need a opened state, etc.
 - Does the design cover all platforms? We might not need the other platforms right away, however, we want to prevent cases where we have a widget which is impossible to adapt to other platforms. In most cases a widget will be identical no matter the platform, however, some things we support on mobile we should not use on desktop. Think bottom sheets, anything depending on touch specific interactions (swiping, panning, etc.). If this applies to the widget, we should insure we have the designs for both web and desktop ready, even if we will only implement the mobile version right now.
 - Ensure the design is (feasibly) scalable. Some designs are hand made using static values for width and height. We can not always use these values, because our widgets need to support scaling. We need to ensure there are no cases where the required scaling if impossible to implement (i.e. having a width be depended on the height, while the height is dependent on the width). Often these sorts of issues will become most apparent when actually implementing the designs in to code, but regardless these sorts of issues should be solved, ideally with the least possible alterations to the design.
 - Ensure all animations are included, most animations will not have to be manually added to the designs, things like switching between variants, sizes, etc. are always animated, however, in the case certain elements pop up on the screen, (popups, bottom sheets, tabs, etc.) we always need animations, and it might not always be clear how these things should be animated if the design does not specify it in any way. Some things might not even be feasible to animate, in these cases a design alteration might be required.

## Step 2: Preparation.
Every widget needs certain parts to be added to the yggdrasil code base. We can split this up in a couple separate parts, you will usually add all these parts before implementing the widget, however you will come back to them multiple times during development.

### Step 2.1: The theme
We currently have all our styling for the app provided to the widget through the theme. We use theme tailor for this which generates all the theme extensions for us. We only need to write the base class used by theme tailor, add the values for every aspect of the widget, and run the code generation using the build runner. The themes are added under `yggdrasil/lib/src/theme`. Do not forget to add the theme you made to the `yggdrasil/lib/src/theme/theme.dart` file in as an `@themeExtension` in order to be able to access the theme from your widget.

### Step 2.2: The demo screen
This is a screen in the demo app which includes almost every single possible variation and usecase of a widget. This screen serves both as a example for designers when we internally release the demo app, and as a tool for development which we can use to easily verify our code is working as intended. Screen are put under `demo_app/lib/screens`, they do not need any cubit or complicated state management and usually only have a single file. When using VSCode we have a plugin called [Folder Templates](vscode:extension/Huuums.vscode-fast-folder-structure) which can be used to create the screen by right clicking the screens folder, clicking create new templated folder > screen > and typing the name of the widget you will implement. Do not forget to add the screen to the home screen for easy navigation.

## Step 3: The widget
How you will implement the widget hugely depends on the what sort of widget it is. All widget however are stored under `yggdrasil/lib/src/components`. There are some types of widgets which have their own way how we add them to the app.

### Widgets without states.
Although uncommon, some very simple widgets might not use any state. The list tile is a good example of this. These widgets are usually very simple any only consist of a basic widget structure using the theme directly from the context.

### Widgets with states.
If a widget has any state as defined in in the [definitions](#definitions) we will usually create both a `YgState` and `YgStyle` next to our widget. Both of these classes provide some logic for us which hugely simplifies animations and styling. A widget might not need to use these stats if it only has a singular states, or multiples states which do not affect the same properties. If there are multiple things affecting the same properties (e.i. both a variant and a disabled state might influence the color of a button) we should always use the `YgState` and `YgStyle` classes.

#### `YgState`
This class should be extended, and should hold usually more than 1 YgStateValue for every state in the widget. (e.i. a disabled would be an `YgStateValue<bool>`, a variant would be `YgStateValue<VariantEnum>`). This class also has a properties getter which needs to be overwritten and return every property it has. Every `YgStateValue` is a `ValueNotifier` and can be listened to for any changes. A `YgState` is a `ChangeNotifier` which notifies it listeners if any of its properties change.

#### `YgStyle`
This class should be extended and should hold usually more than 1 property which represent any type of visible property which is animated by the state values (e.i. a color, padding, sizes, etc.). These properties all follow the `YgDrivenProperty` interface. These properties are not created manually, but instead are created using the `drive`, `animate`, or `all` methods on the `YgStyle`.

You will create a resolve method for every property on the style and pass those to the `drive`, `animate`, or `all` methods depending on your requirements.
 - **`drive`** This method will call resolve any time a value on the `YgState` changes, it will not animate the value, but instantly update its property if the resolved value changes.
 - **`animate`** This method will call resolve any time a value on the `YgState` changes. If the resolved value is different from the previous value it will animate from the previously resolved value to the newly resolved value. It will either use the duration and curve defined on the `YgStyle` or you can manually pass a different value in case certain properties need to be animated at different speeds.
 - **`all`** This method will only call resolve if the theme changes. This property is not used in most widgets as they will just directly access the theme from the context, however, in some cases where you do not have access to the context (e.i. painters, render objects, etc.) it might be useful to have access to all possible properties used in the painting from the style.

When using `YgState` and `YgStyle` you will usually update your stateful widget to not extend `State` but instead extend `StateWithYgStateAndStyle` which simplifies creating, and disposing the `YgState` and `YgStyle`.

### Buttons
Buttons have their own folder, and for good reason, all our buttons are build around the `YgButtonBase`. This class has it's own base state and style which can be extended to style the base button class. Usually you will only need to apply styling to the button and will not have to do any layout to add a new button.

### Fields
Fields are quite complicated widgets. Most of the fields are based around the same decoration class, so we standardized this. Every field internally uses the `YgFieldDecoration` widget and may use the `YgFieldContent` widget. These widgets supply all required styling and animations for the main part of the field.
