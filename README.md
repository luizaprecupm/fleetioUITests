## Requirements

- Xcode installed and project cloned
- Any simulator connected 


## Design Pattern Used — XCUITest with Page Object Model (POM)

**Organizing Locators with Swift Enumerations**: The basic concept is that each screen will have a corresponding enum containing accessibility id's or string value for each element in that view. This means that in case our elements locators change, we’ll have to do minimal work by changing them in one single place.

**Action Class**: The Action Class  allows us to interact with the XCUIElements and perfom any actions on them: like tap(), XCTAssertTrue etc. Each of the public methods should return something - either self, other screen object, so we could chain them in our UI Tests.

**UI Test Class** Is the parent class of all test classes and will be using the methods defined in the Actions classes. By chaning these we're hoping to achieve better readability, ease of use while also testing end to end.

**Contracts** I've used protocol to get generic and reusable components. Most of these have default implementations which grants us ready implemented functionality to any consumer.

**Extensions**: We make use of the protocol extensions as they allow us to add new functionality to existing classes, structures, enums, or protocols without modifying their original implementation.


## Running the UI Tests

- Start Xcode
- Open the project
- From the Schema chose fleetio-go-e2e-sample and select a simulator where you want to run the tests
- From the project navigator go to fleetio-go-e2e-sampleUITests/ UITests and chose one of the swift test files CreateANewFuelEntryTest or SearchForNonExistingCarTest where all the tests are located
- In front of each class there's a play button triggering the whole tests in that class or a play button in front of each test to run them one by one. Give it a try!
  
