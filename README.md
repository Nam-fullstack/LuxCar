## GitHub Repository

Link to the [GitHub Repository](https://github.com/Nam-fullstack/LuxCar)

## Heroku Link

Link to the [Deployed Heroku App]()
**NB: Have not been able to deploy app to any webhosting platforms due to build/compilation error where couldn't find dependency for gem, 'spring' (= 2.1.1).**
For marking purposes, please cd into the src folder, and run the following commands in Terminal:
**`bundle install`**
**`bundle update`**
**`yarn install --check-files`**
**`rails db:create:migrate`** and **`rails db:seed`**
Once complete, run:
**`rails s`**
And in your web browser, type in the url:
[http://localhost:3000/](http://localhost:3000/)

Also, please ensure that you have another terminal window open and run the following command to ensure Stripe payment webhooks are functioning properly:
`ultrahook stripe 3000`
You may need to change the public and secret keys to match your stripe account, or alternatively, please don't hesitate to contact me on discord for my master key.

Users have been seeded, details are:
**email:** test@test.com
**password:** testing
There are an additional 10 other users with the email: user1@test.com, user2@test.com etc. Each with the same password, testing.

A folder with photos of cars organised in their respective manufacturer/make has been provided for you to pick from. Prices of these cars generally range from minimum of AUD 120,000 to ~ AUD 38M for a Rolls-Royce Boat Tail and close second of 26M for a Bugatti La Voiture Noire. For purposes of the application working, the price cannot be over 10M due to price cap set by Stripe.

## Purpose

To function as a two-way marketplace application designed for users to buy and sell high-end luxury cars.

## Target Audience

The app is intended for people that are looking to buy their dream supercar at a considerably more affordable price, and those wanting to sell their supercars without having to pay excessive broker fees or lose out on a large margin by selling their car to a dealer as they have to make a profit out of it at the end of the day.

## The problem and why it's a problem that needs solving

When we go to sell or buy a car, whether that be a brand new car from the dealership, second hand privately or from dealer, it’s often difficult to get an accurate gauge of what the value of the car should be. The price we can get from seller privately or trade-in at the dealer varies with a high degree of margin. This is even more exacerbated when it comes to high-end luxury cars where a 2% difference could result in a margin of $120,000. You can buy a brand new Porsche 911 Targa for that money. Previously, up until a few years ago, carsales.com didn’t have Redbook valuation API integrated and hence without paying for a valuation, you wouldn’t be able to readily know the market value of any car model/variants.

Carsales.com is a well-trusted platform with a lot of searching and filtering functionality. It is arguably the number 1 place when it comes to second hand car sales. However, it is predominantly more focused on your typical everyday consumer car, and rarely, do they list high-end luxury exotic cars north of AUD$1M. Depending on the price of your car listing, they charge from 39/day for cars under 5,000 to 389/day until sold for cars over 60,000. You can quite easily rack up a 20,000 dollar fee over 60 days, which could end up costing you more than just the difference of simply just trading your car in at the dealer.

Another common issue that sellers need to deal with is having to deal with people that just waste their time and just want to go for a joyride in their car with no real intentions of buying it. When you’re making a lot money, time is money, you don’t have time for tire kickers. So when you’re looking to buy a high-end luxury car or sell one, most people don’t have the platform or connections to genuine, eligible buyers/sellers unless they go through a broker. The broker, most certainly will take their cut on the sale too, which at the end of the day can result in a large amount of money taken out of your pocket, particular for high-end cars.

By offering a secure and specialised service for buyers and sellers to view, buy, contact and test drive cars, it broadens their reach to the intended target audience as typically it’s only within smaller trusted circles that these type of people buy or sell their cars privately. Having a secure refundable deposit payment service that filters out buyers that can genuinely afford and buy the car, it removes much of the undesired strain on the seller having to deal with all the car fanatics that simply just want to go for a quick spin in their dream car just for the experience.

Currently, there are no websites or apps the are dedicated towards the buying and selling of high-end supercars and hypercars. Carsales’ database doesn’t even include a large variety of the exclusive high-end models. When it comes to enquiring about the price for a luxury vehicle at dealers, the only way for a buyer to get the price information is to contact the dealer and submit an application to get a POA (Price On Application). All that effort just to find out the price. Other than carsales and dealership websites, which charge a considerable mark-up in addition to all the costs associated with import fees and freight, there’s no website or application that specialises in buying and selling of high-end luxury cars. LuxCar helps give the opportunity for people that are looking to purchase their dream car second hand at a fraction of the original MSRP after it’s gone through the bulk of the depreciation after the first 2-3 years. It provides a safe and secure environment for people to buy and sell their high-end luxury cars and expands their reach to a larger market of buyers and sellers.

## Functionality/features

- Create an account
- Delete account
- Create listing to sell car
- Upload multiple images linked to their listing using Amazon’s S3 cloud storage
- Browse other users’ listings to purchase a car if they wish
- View, update and delete on listings
- Buyers can schedule a test drive by creating a calendar event, which is only available after they have paid a 10% refundable deposit, in which the seller then can confirm details of time and location etc.
- Users can search for listings which will return partial matches with values for year, make, model, engine, displacement, body type, doors, transmission, speed (gearbox), drive and fuel type
- Filter listings by make (manufacturer) from home page
- Sort listings by price, year, power, mileage and most recent listings to make search easier according to their desired preferences
- Purchase a listing using Stripe (deposit only so far, haven’t implemented having another session for full payment)
- View active listings in profile page
- View purchase history and sold listings in profile page
- View events in profile page
- Enquire the seller to ask any questions, negotiate price, or if they wish to see more photos. (not implemented)
- Add listings to their watchlist/favourites (not implemented)
- Live GPS location sharing for meetup event (Test drive) (not implemented)

### User Stories

##### As a user, even if I don’t have an account:

- I want to be able to view all car listings.
- I want to be able to search for listings by title to quickly find what I’m interested in buying.
- I can register and create a new account to be able to list and buy cars and use the website’s features.
- I want to be able to sort listings by year made, price to make it easier to view listings based on my desired preferences.
- I want to be able to view listings by a particular manufacturer if I prefer a specific car manufacturer.

##### As a buyer:

- I want to be able to I want to be able to favourite listings I’m interested in so I can monitor and/or quickly view them at a later date.
- I want to be able to see multiple pictures of the car I’m looking at purchasing.
- I want to be able to send a message to the seller to ask questions or negotiate price.
- I want to be able to securely purchase a listing online.
- I want to be able to schedule an appointment to test drive the car.
- I want to get and view an invoice for a purchase I’ve made.
- I want to be able to view my purchase history in my profile.

##### As a seller:

- I want to be able to edit and update a listing I have made with additional details or fix incorrect details.
- I want to be able to delete a listing if I don’t wish to sell my car anymore.
- I want to be able to view my listings in my profile so I can easily edit or delete them
- I want to be able to have a record of any cars I’ve sold.
- I want only genuine and eligible buyers to be able to test drive my car, that have paid a deposit before they can book a test drive.
- I want to be able to view scheduled test drives on the calendar to help make management easier.
- I want to be able to edit scheduled test drives to a time and place that suites me.
- I want to be able to confirm scheduled test drives.
- I want to receive notifications or alerts to remind me before scheduled events.

## Tech Stack

- HTML
- CSS/Sass
- Ruby on Rails
- PostgreSQL (database)
- Stripe (payments)
- Bootstrap (styling)
- Devise (user authentication)
- Amazon AWS S3 (image upload and cloud storage)
- Heroku (deployment and web hosting) - could not build.

## Sitemap

![sitemap](./docs/updated-sitemap.png)

## Wireframes

Landing Page
![landing page wireframe](./docs/homepage.png)

Listing Index
![listing index wireframe](./docs/listing-index.png)

Variant New
![variant selection wireframe](./docs/variant-select.png)

Features (Listing New)
![features wireframe](./docs/features.png)

Listing Show
![listing show wireframe](./docs/listing-show.png)

Messages
![messages wireframe](./docs/messages.png)

Events
![events wireframe](./docs/event.png)

Live-location sharing
![live-location sharing wireframe](./docs/live-location.png)

Profile Index
![profile wireframe](./docs/profile.png)

## Screenshots

Home page
![home page hero image](./docs/home2.png)

Home - Filter by Make
![home page view by make](./docs/home1.png)

Listing Index Page
![listing index1](./docs/index1.png)
![listing index2](./docs/index2.png)

Listing Show
![listing show1](./docs/show1.png)
![listing show2](./docs/show2.png)
![listing show3](./docs/show3.png)

Variant New
![variant new](./docs/variant-new.png)

Listing Edit
![listing edit1](./docs/update1.png)
![listing edit2](./docs/update2.png)

Variant Edit
![listing variant edit](./docs/listing-variant-edit.png)

Filtered Listings by Make
![filtered listings by make](./docs/filter.png)

Payment Success
![payment success](./docs/payment-success.png)

Event New
![event new1](./docs/event-new1.png)
![event new2](./docs/event-new2.png)

Event Edit
![event edit](./docs/event-edit.png)

Event Index
![event index](./docs/event-index.png)
![event index2](./docs/event-index2.png)

Event Unauthorized Access
![unauthorized access](./docs/unauthorized.png)

Profile Page
![profile page](./docs/profile1.png)
Profile Page part2
![profile page](./docs/profile2.png)
Profile Page part3
![profile page](./docs/profile3.png)

## Initial ERD

![initial ERD](./docs/initial-erd.png)

## Final ERD

![final ERD](./docs/final-erd.png)

The initial and final ERDs are basically the same, with main differences of the initial being tech agnostic, such that it is applicable to any framework with tables for pictures and video attachments, and in the final ERD, tables and associations for ActiveStorageAttachments, ActiveStorageBlobs and ActiveStorageVariantRecords were incorporated for the Rails application. Also, Locations was consolidated into the Events table. Purchases also had the addition of seller_id, as all the logic around buyer/seller authentication and authorization for events based off purchases became quite complex. Another addition is the deposit for the listing, which was an added feature to filter out eligible buyers. Also, partly because Stripe had a limit of 1 million dollars for the price, and quite a fair number of these cars have a price tag of well above that. Also, I decided not to store specific address details for each user since the rarity of the cars and travelling for the acquisition of such rare cars shouldn't really matter as much to the target audience, and the meet up location can always be discussed or negotiated.

## High-level Components (abstractions)

#### Filter Component

One the home page, there is a filter by make component where there is a list of all the makes in which the user can View Cars by Make by clicking on the image of the logo. By clicking on the image, which has a link_to path: filter_listings_path. The route with the corresponding prefix is:
`Get ‘filtered’, to: ‘listings#filter’, as: ‘filter_listings’`. Clicking on this sends a get request from the client to the listings controller’s filter method. Clicking on the image also passes in the make_id for that particular make in params. The filter method, assigns to an instance variable @listings, listings that have been filtered by the make_id from params. This is represented by the following line of code:

```ruby
@listings = Listing.filter(params[:make_id])
```

This invokes the method in the Listing model, self.filter, where the make_id obtained in params from the controller is passed in. This method joins Listings to Variants, Variants to Models, Models to Make, and queries ActiveRecord relations for listings with the corresponding associations where the make_id matches to the value passed in, i.e. 4 for BMW.
This is achieved with the following block of code in the listing model:

```ruby
  def self.filter(make)
    if make
      return self.joins(variant: :make).where(make: { id: make })
    else
```

Once the database query is done, it will return the corresponding ActiveRecord (AR) relations for listings as an array, and will be assigned to @listings.

Then in the filter method in the listings controller, passes @listings to the views, and it renders the listings index view, where it iterates over each listing in @listings and every listing gets rendered as a card, ‘shared/listing-card’. Each ActiveRecord object, listing, will have all the information for that particular listing (i.e. Listing id, user id, variant id, price, mileage, title, description, state id, postcode, sold, deposit, created at and updated at). And since we have foreign keys (FKs) for variant, which has FKs for all the other linked associations, we are able to access the information of those related tables by chaining in order to access information from tables that are 2-3 relations away:

```ruby
listing.variant.door.body_type
```

Similarly, if we wanted to filter listings by year, we’d get the user select a range, from to, i.e. from 2016 to 2021. We would just need another method to determine what the filter by option selected is, and adjust the query so that it will be something along the lines of:

```ruby
self.joins(variant: :year).where(year: { year: 2016..2021 })
```

Where we will need to pass in an upper and lower value for the year range.

Similarly, we can also filter listings by price range, mileage, body type, colour, engine type, etc. Filtering by these attributes have not yet been implemented, but the concept would pretty much be the same.

Other high-level components for the app are: listing, variant, event, profile.

#### Listing Component

To create a listing, we first need to create a variant in order to assign the variant_id for the listing. Initially, I initially designed the database to essentially work with a car API like Redbook or Edmunds, however, had issues with gaining access to those APIs since they only allow commercial parties to access their data. How the app was intended to work was the user would select the year, the make, and then that would populate the models in production for that particular make in the year selected. Upon selecting the model, the user would then select a few more options, depending on the model if it's petrol/diesel, sedan/coupe/convertible, and then a small list of the variants would be displayed for the user to select. This in turn would select the corresponding variant id, which would be used to create the listing without the user having to input/select all the data for the car like engine type, drivetrain, displacement, transmission etc. However, without access to the API data, the user has to select the data. Once the variant has been created, since the general convention for the variant name is the model year(MY), make, model, badge/trim, engine displacement, engine type, fuel, no. of doors, body type, all combined together in the name, we need to update the variant name to have all of those details from the other attributes.

After form submission for the variant, the user is directed to new_listing_path, which the user fills out a form to create a new listing. Upon filling out all the fields and uploading photos, a new listing is created. The variant id is assigned using `@variant = Variant.last` since there's no way to link the variant to the user without having first created a variant, then going on to create a listing that is linked to the user:

`@listing = current_user.listings.new(listing_params)`

Before saving, the Listing model converts the price to cents, explanation can be found in the comments in models > listing.rb . Also, the data is sanitized by removing white space from all of its attributes if the value responds to #strip. This is done for all components that have any user input - users, variants, listings, events, messages, location etc. Since humans are more accustomed to seeing price in dollars, we display the price in dollars, however, when storing it in the database, we have to convert the price back to cents, as integers tend to be more accurate and less susceptible to data loss.

Onced created and saved, the user is directed to the listings#show view. As the listing owner, the user cannot buy their own listing, however, they are able to edit and delete their listing, which the conditional logic happens in the views. We check if the current user's id matches the listing user's id, if it does then they can edit and delete. Also, there is conditional logic for the buy button in the \_buy-button.html.erb partial. We determine if the user is the owner of the listing, or if they have made a purchase (paid a deposit) for that listing, if so, they buy button is disabled. Otherwise, if the user is signed in and the listing hasn't been sold, then they are able to view the buy button. Alternatively, if it's been sold, then the buy button is disabled, and if none of those conditionals are met, renders a button, 'Log in to buy' which directs the user to create a new account.

#### Event Component

Events or Test Drives, are only available to buyers that have successfully paid a 10% deposit on the car. Upon successful payment, the user is directed to a payment_success page where they have a link to view the despsit invoice, and also a button to "Schedule Test Drive". Click this button directs them to new_event_path, in which we pass in params for purchase_id.

There is a lot of authorization here to determine if the user is a buyer, user is a seller that hasn't made any purchases, user is a seller that has made purchases, or an unauthorized user that is neither seller or buyer. It's also important the the right event is assigned, and all the relevant events linked to the user is displayed.

Firstly, with any page other than the home page, listings index and listing show, the user must be signed in to access those pages. So devise's authenticate_user! before action stops an unauthenticated user from being able to access this part of the app.

Next, if a signed in user is not a seller and has not made a purchase, they are redirected to listings#index.

```ruby
def is_seller
  current_user&.listings.count.positive?
end
```

```ruby
def has_purchased
  !current_user&.bought_cars.empty?
end
```

Also we need to redirect the seller if they have not made a purchase since they simply cannot book a test drive without paying for a deposit, despite having a listing, in which might have events linked to it.

If the user has paid a deposit, there will be an associated event with their corresponding user id in the buyer_id column in the Events table. This is accessible from the user, using

```ruby
@purchase = current_user.bought_cars.last if has_purchased
```

This line also assigns the corresponding Purchase AR object to @purchase, which is crucial for determining the right associated listing and event linked to this purchase, with before actions -

Before a user can create an event, there's a conditional to check if an event exists based on the corresponding purchase_id. If the query to check if an event linked to the purchase_id is nil, only then does the views renders the form to create an event. If an event associated with their purchase already exists, then there's a button to direct to the event show page, with event id, which uses an event helper method, event_exists. These extra measures are in place to ensure that duplicate events/database entries don't exist.

When creating an event, the views displays a calendar month with the current date, using Simple Calendar gem, which sets up the calendar and automatically does all the styling. The buyer can choose a location, time and also include a message.

Upon form submission, the user is directed to the Events index page, where a calendar month is rendered with the details of their event(s) on the date the selected, with the title of the event and time. Also, below is all the details for the event, including a confirmed status, in which only the seller has access to.

Now for the seller side of things. Firstly, we need to determine if the seller's listings have any purchases, seller_has_buyers, which references the seller_id column on the Purchases table.

```ruby
def seller_has_buyers
  !current_user.sold_cars.empty?
end
```

If the seller has buyers, we need to query the events where the purchase ids corresponds with the purchases that have seller_id as the current_user's, this is stored as @events.

Next we have to determine if the seller has any events based on their purchases. Querying the Events table where the purchase id matches the purchases that corresponds to the user's id as buyer_id. This is stored into a variable as seller_purchases.

To combine the events as a seller and events as a buyer, we have to combine the AR objects together using .union or .or to combine the two together and not have any event data overwritten/replaced. In this case, we're reassigning the combined result into @events.

```ruby
if is_seller && has_purchased
  seller_purchases = Event.where(purchase_id: current_user&.bought_cars.ids)

  @events = @events.or(seller_purchases)
```

We also need to take into account all the events for a user that is a buyer, but isn't a seller. Given the previous conditional was checking if the user is a seller and also a buyer, this else statement assigns

```ruby
@events = Event.where(purchase_id: @purchases.ids)
```

So all the events for the buyer is displayed.

Back to the confirm button, as a seller they will have all the events displayed with all the information. They can also edit the details for location and time if they wish to and respond to the buyer. The confirm button only appears if the event status is unconfirmed, and if their user id corresponds with the event's purchase's seller_id. The button is routed to the events#change_confirmed method in the events controller, which passes to the controller the relevant event id in params. The controller then finds the Event based on the id from params, and updates confirmed to true. This change is reflected immediately after the update, as the user is redirected back to the events index page.

#### Profile Component

I've gone into extensive detail with the other components and will give a very brief overview of the abstractions for this profile component, which is essentially a summary page of all the other components.

From the conceptual design, the profiles component is meant to be a dynamic display of each selected category, i.e. My Listings (active), Sold Listings, Purchase History, Messages, Events etc. and update and delete for profile using javascript to select and onclick, display different components.

Each of the listings that are returned from the queries below are rendered as cards.

My Listings, Sold Listings: checks if the user has any listings, if not, doesn't display or do 2 database queries for listings and sold listings.
My Purchases: queries to see if the user has made any purchases.

There is also a button to display events if the user has any events, using a has_events profiles helper method.

The user can also view the event for a particular listing from their My Purchases section or in the listing index page.

## Third Party Services

LuxCar uses the following third-party services: Devise, Stripe, Bootstrap, Simple Calendar, Amazon Web Services S3, Heroku (could not deploy due to build failure).

Conceptually, the app was also intended to use Google Maps API for Live Location sharing and also Redbooks API for car data and valuations. In a nutshell, to use these third party services, I would have needed to obtain an API token, which grants access to their database, define a route which will do the API calls, in which we'd pass in the url with the endpoint, response format and api key. Then to fetch the data (response), which is in the form of a JSON string, in which we have to parse the response. From here we'd have access to the object data, in which we'd create listings with the corresponding variant and relevant values for all the other specifications.

### Devise

The third party services used in the app were Devise for user authentication. It is composed of 10 modules: Database Authenticatable, Omniauthable, Confirmable, Recoverable, Registerable, Rememberable, Trackable, Timeoutable, Validatable and Lockable. Of the 10 modules, 7 are implemented, except for confirmable, which sends and email confirmation in order for the user to register, trackable, which tracks how many times a user has signed in, timestamps and IP Address, and Omniauthable, which allows sign in from other applications.

The modules used are:

- **Database Authenticatable:** hashes and stores a password in the database to validate the authenticity of a user while signing in. The authentication can be done both through POST requests or HTTP Basic Authentication.

- **Timeoutable:** expires sessions that have not been active in a specified period of time (20 minutes).

- **registerable:** which handles users signing up through a registration process, also allowing them to edit and destroy their account.

- **Recoverable:** resets the user password and sends reset instructions.

- **Rememberable:** manages generating and clearing a token for remembering the user from a saved cookie.

- **Validatable:** provides validations of email and password.

- **Lockable:** locks an account after a specified number of failed sign-in attempts. Can unlock via email or after a specified time period.

### Stripe

Stripe is a third party platform that's used to handle user credit card payments. As there are legal requirements and regulations in place for storing of credit card (CC) information, to satisfy Payment Card Industry Data Security Standard (PCI DSS) compliance, we should avoid storing that data in our database. Instead, we let Stripe store the CC details and access that data through an authenticity token and public key. Stripe does charge a 1.75% fee for domestic card payments and 2.9% fee for international card payments.

To use Stripe, we need to register and account and generate a public and secret key in which we assign into our credentials file. We also have to add the stripe script to our application.html.erb, and using AJAX, have a buy button that upon clicking on it will create a payment intent, and the user is redirected to the checkout with the correct sessionId. Upon successful checkout, a webhook is sent to our Rails server using Ultrahook, in which we get all the payment data back from Stripe.

### Bootstrap

Bootstrap is a front-end framework that is used to create and style modern websites. Bootstrap features numerous HTML and CSS templates for UI elements such as buttons and forms. It's fantastic for creating responsive layout and is designed to conform to different devices sizes. To use it, we just have to go through a few steps to set it up, and essentially use the pre-defined styling and colours by assigned a specific bootstrap class to the HTML element(s) we wish to style.i.e. `class="btn btn-primary mx-4 p-2` which automatically styles the button with Bootstrap styling, and has a blue colour, with margin on the x axis of Bootstrap's interval for 4 and a padding all round of 2 based on Bootstrap's interval.

### Simple Calendar

This gem helps display a pre-styled calendar to the page, where for each event, it is rendered on the corresponding calendar date, given that it's has the attribute of **start_time** which is a datetime value. Simple Calendar uses AJAX for the buttons that select to go backwards or forwards to the next month. Although Simple Calendar did come pre-styled, I did make adjustments to the styling to make it responsive. Also, the user's time zone had to be enabled in the config settings for it to correctly reflect the user's time zone.

### Amazon AWS S3

As server space is quite expensive, cloud storage utilising Amazon's AWS S3 was used for users upload their attached images for their listings. Amazon S3 cloud storage is an object-based storage service. The objects can be located on various physical disk drives distributed across a datacenter. The objects are stored in Amazon S3 buckets.
An infinite amount of data and unlimited number of objects can be stored in a bucket. There is, however, a 5 TB limitation for the size of one object stored in a bucket. Buckets are used to organize namespace at the highest level and for access control. However, due to not being able to even successfully build and deploy the application to Heroku, Amazon S3 services never ended up being used as it was only set for use in production environment.

### Heroku

Heroku is a container-based cloud Platform as a Service (PaaS) hosting service which we can deploy the LuxCar app to. It would host the entire application, including the PostgreSQL database. It's a fantastic tool to build, monitor and scale apps without all the nightmares and headaches of having to maintain an infrastructure/servers.

## Model Associations

The three models that are the heart and core of the entire application are Users, Listings and Variants. Everything stems from Users, their Listings and all the data associated with that particular variant.

For each association pair, on the side that has the belongs_to association, that table has the foreign key (FK) and belongs to it’s corresponding association pair. On the side the has the has_one or has_many associations, that table has its primary key being referenced by the conjugate table.

#### Users

The User model tracks the application’s users and their related activities, the following active record associations apply to the User model:

- has_many :listings

Each user can create multiple listings to sell multiple cars, but it is optional since they can also have zero listings. Enables rails to understand: `@user.listings`

- has_many :sold_cars, class_name: "Purchase", foreign_key: "seller_id"

A user can have multiple listings sold, or not have any sold listings. It associates the purchase to the user (seller) using seller_id as the FK in place of user_id.
Enables rails to understand: `@user.sold_cars`

And essentially does this in SQL:
`SELECT "purchases".\* FROM "purchases" WHERE "purchases"."seller_id" = $1`

- has_many :bought_cars, class_name: "Purchase", foreign_key: "buyer_id"

A user can have multiple listings bought, or not have any bought listings. It associates to purchase to the user (buyer), using buyer_id as the FK in place of user_id.

- has_many :conversations

Every user can have a conversation with multiple other users, or not have any. Conversations belongs to the user.

- has_many :messages

Each conversation can have many messages or not have any. Messages belongs to the user.

- has_one :profile

Each user only has one associated profile.

- has_many :events

As a buyer, they can have multiple events if they have bought multiple cars, or none. As a seller, they can have multiple buyers that want to test drive the car, or none at all.

#### Listing

Listings is one of the core models, it is the basis and foundation for each transaction.

- belongs_to :user

Each listing can only be made by one user.

- belongs_to :state

Each listing has one associated state that it’s listed in.

- belongs_to :variant

Each listing has only one specific car variant.

- has_one :make, through: :variant

Each variant has one make, as the variant belongs to one car model in which belongs to one make. This in turn implies that each listing only has one make. This association enables us to extend the scope and join Makes to Listings and allows us to view by (filter) and also sort listings by make if we wanted to.

- has_one :year, through: :variant

Each listing has one year that the car was manufactured in, this association happens through the variant table. This association also enables to sort listings by year. This enables us to do:

```ruby
  @listing.variant.year
```

- has_many :listings_features
- has_many :features, through: :listings_features

Each listing can have none or multiple features through listings_features which serves as a join table.

- has_many_attached :pictures

Each listing can have multiple, one or no attached pictures.

- has_many :watches
- has_many :profiles, through: :watches

Each listing can be added to multiple users’ watchlists, which will be linked/accessible through their user profile (not implemented).

- belongs_to :state

Each listing belongs to a particular state defined by user, as they can be away from home and wish to sell their car in another state.

- has_many :purchases

Technically, this should be has_one: purchase, as each listing should only be purchased once. However, since there can be multiple people that can test drive the one car, we need to allow listing to have many purchases for multiple deposits to test drive. (A second stripe session hasn’t been implemented yet to pay full price). It would make more sense to have deposits for test drives in a separate table if both full payment and deposit systems were implemented.

- has_many :events, through: :purchase

Each listing can have many events (test drives), where there are multiple buyers coming to see and test drive the car, there can also be one or none as well. However, given that a buyer has to have paid the deposit before they are eligible to book a test drive, it has to go through the purchase table.

It is also important to note that the order of these associations is important, particularly if there are any associations that are through another table. The association for the “another table” has to be declared first otherwise the “through another table” relationship can’t exist if there’s no table to go ‘through’. For example, has_many :events, through: :purchase has to be declared below has_many :purchases as there has to be a relation to the purchases table in order to get to the events table since the listing_id FK column doesn’t exist in the Events table.

#### Variants

This table is where all the linking to all the different attributes/data happens. The associations are defined as follows:

- belongs_to :model

Each car model has various variants with differing specs, so the variant belongs to the car model.

- has_one :make, through: :model

As each car model belongs to a make, this implies that each variant has one make, through it’s model.

- belongs_to :door

It’s a bit counter-intuitive to say that a car belongs to the door(s), it would be more correct to say that the number of doors should belong to a variant. However, as the door FK is on the Variants table, technically speaking, the variant belongs to the door, and likewise for all the other associations described below.

- belongs_to :drive_type

Each variant belongs to the drive_type, having FK. Each car can only have one drive type.

- belongs_to :engine

Each variant belongs to the engine, having FK. Each car can have one engine.

- belongs_to :fuel

Each variant belongs to it’s fuel type (what powers the car), having FK. Each car can only have one fuel type.

- belongs_to :year

Each variant belongs to the year that it was made in, having FK. Each car can only have one year.

- belongs_to :speed

Each variant belongs to the speed (gears in the transmission), having FK. Each car can only have one speed.

- has_one :transmission, through: :speed

Each car can only have one type of transmission, and each transmission type (automatic or manual) can have many speeds. The variant can only have one transmission through speed.

- has_one :body_type, through: :door

Each car body_type or style has either 2 or 4 doors (3 or 5 doors for a hatchback). The car can only have one body type. The door belongs to the body type, and the variant belongs to the door. Hence the variant has one body type through door.

- belongs_to :colour

Each car can only have one colour (technically, they can have multiple, but for simplicity sake, the primary colour of the car is one colour), having FK.

#### Models

- belongs_to :make

Makes have different car models, in which, the model belongs to the make.

- has_many :variants

Car models have different variants, which in turn, translates to the model has many variants since the FK is on the variants table.

#### Makes

- has_many :models

A make has many car models.

- has_many :variants, through: :model

A make’s model has many variants, so the make has many variants through the models.

#### BodyTypes

- has_many :doors

Each body type can have 2 different number of doors.

- has_many :variants, through: :doors

Each body type can have many variants, since car variants can be all sorts of body types and those can have varying amounts of doors, but for the AR associations, body type has many doors, and doors have many variants, so body type has many variants through doors.

#### Colours

- has_many :variants

A colour can be on many different variants.

#### Conversations

A conversation exists between two users, a sender and receiver.

- belongs_to :sender, class_name: ‘User’

Each conversation has a sender, which is only one specific user.

- belongs_to :receiver, class_name: ‘User’

Each conversation has a receiver, which is only one specific user.

- has_many :messages

Each conversation can have many messages between the sender and recipient, or none at all.

#### Messages

- belongs_to :conversation

Each message is associated with only a single conversation between two users.

- belongs_to :user

Each message is created/sent by a single user, the sender.

#### Doors

When referring to door, we are talking about how many doors the car has, so for example, a 2 door coupe or a 4 door sedan.

- belongs_to :body_type

The doors belong to the car body type, having the FK.

- has_many :variants

Each door can exist in many different variants.

#### DriveTypes

- has_many :variants

Each drive type can be in lots of different cars/variants. i.e Cars that are AWD / RWD / FWD.

#### Engines

- has_many :variants

Each engine type (i.e. V8, V10), can be in many variants.

#### Events

- belongs_to :purchase

Each event can only exist after a purchase has been made, and only has one purchase.

- has_one :listing, through: :purchase

Each event is linked to a listing and only has one listing, through a purchase.

- has_one :buyer, through: :purchase

Each event has one and only one buyer, through the purchase table.

- has_one :seller, through: :purchase

Each event has one and only one seller, through the purchase table.

#### Fuels

- has_many :variants

Each variant can only have one fuel type, however, variants can have different fuel types.

#### Features

- has_many :listings_features
- has_many :listings, through: :listings_features

Each feature can be in many listings, through a join table – ListingsFeatures, which enables a many to many relationship between the two.

#### ListingsFeatures

ListingsFeatures acts as a join table between Listings and Features and enables the two tables to have has_many to has_many associations.

- belongs_to :listing
- belongs_to :feature

The join table is necessary in order to store all the references to the corresponding FKs. For example, a listing can have 2 features, and a different listing can also have one of those features too:

##### listing_id | feature_id

1 | 2
1 | 5
3 | 2

This allows us to have a many to many relationship without having to index the listings table every time for each different feature or vice versa.

#### Locations

Originally intended to be used with event to store the meeting location, however, decided to have this normalised and have the location stored in the Events table to make it easier to create and update an event, given all the complexities already associated with it.

- belongs_to :event

Each event has an associated meet up location.

#### Profiles

- belongs_to :user

Each profile is associated with a user

- has_many :watches
- has_many :listings, through: :watches

Each profile can have multiple associated listings that are watched through a watchlist, or none at all.

- has_one_attached :image

Each profile has one attached image that is stored using Active Storage or Amazon S3, or not have an attached image.

#### Purchases

Purchases technically should be for full payment, but since second stripe session hasn’t been implement to have full payment and deposit, the purchases table is only for deposits made in order to test drive.

- belongs_to :listing

Each purchase belongs to a specific listing.

- belongs_to :buyer, class_name: ‘User’

Each purchase only has one buyer.

- belongs_to :seller, class_name: ‘User’

Each purchase has one corresponding seller.

- has_one :event

Each purchase has one associated event, optional.

#### Speeds

- belongs_to :transmission

The speed/gears belongs to the transmission (gearbox).

- has_many :variants

Each speed be in many different variants.

#### States

- has_many :listings

Each state can potentially have multiple listings or none at all.

#### Transmissions

- has_many :speeds
- has_many :variants, through: :speeds

Each transmission (auto/manual), has many speeds (5-speed, 6-speed) etc. and is in/has many variants.

#### Watches

- belongs_to :profile

Each watched listing/car is linked/associated with a single user’s profile.

- belongs_to :listing

Each watched car is a specific listing.

#### Year

- has_many :variants

Each year, there are many variants made in that year.

- has_many :listings, through: :variant

Each particular year can have multiple, or no listings, through that year’s variants.

## Discuss the database relations to be implemented in your application

As general good database design practise, for each relation, although the ordinality for both can be optional, one side of the relationship should always be mandatory. Drawing from the active record associations discussed above and referencing the ERD, we can identify all the database relations that are to be implemented.

Besides profile, all of the relations for user, 2-6, are a one-to-many (optional) relation:

1. A user can only have one profile, this is a one-to-one relation (one and only one)
   Relations 2-6 below are all one-to-many (optional)

2. A user can have many listings (optional), a listing can only have one user.

3. A user can have many purchases (optional), a purchase only has one user as the buyer.

4. A user can have many purchases as a seller, a purchase only has one user as the seller.

5. A conversation has 2 users, one as a sender and one as a receiver. A user can have many conversations (as the sender and as the recipient). This relationship is quite different to all your other typical relations since there is a one-to-many relation between the user as a sender and with conversations, whilst also having a one-to-many relation between the user as a recipient and conversations.

6. A user can send many messages, a message only has one sender (user).

7. A conversation can have many messages (optional), a message only has one conversation. This is a one-to-many relation.

8. A profile can have many listings, through watches (optional), a listing can have many profiles, through watches. This is a many-to-many relation with Watches as the join table.

9. A purchase can only have one event, a event can only have one purchase. This is a one-to-one relation.

10. A listing has many features, through ListingsFeatures, which acts as a join table. Features can have many listings, through ListingsFeatures. This is a many-to-many relation.

11. A listing has one state, a state can have many listings (optional). This is a one-to-many relation.

12. A make has many models, a model can only have one make. This is a one-to-many relation.

13. A listing can have one variant, a variant can have one listing (optional). This is a one-to-one relation.

This block 14-24, is for variants, each of these relations are all one-to-many (optional), on variant.

14. A variant has one year, a year can have many variants (optional). This is a one-to-many relation.

15. A variant has only one model, a model can have many variants.

16. A variant has one engine, an engine can have many variants.

17. A variant has one speed, a speed can have many variants.

18. A variant has one transmission, through speed, a transmission can have many
    variants, through speed.

19. A variant has one fuel, a fuel can have many variants.

20. A variant has one door, a door can have many variants.

21. A variant has one body type, through door, a body type can have many variants, through door.

22. A variant has one drive type, a drive type can have many variants.

23. A variant has one colour, a colour can have many variants.

24. A variant has one make, through model, a make can have many variants, through model.

25. A speed can have one transmission, a transmission can have multiple speeds. This is a one-to-many relation.

26. A door can have one body type, a body type can have multiple doors. This is a one-to-many relation.

27. A listing can have many attached images (optional) as active storage blobs through active storage attachments. Active storage attachments acts as a polymorphic table, linking a listing to it’s associated active storage blobs. Each blob has metadata for the image and details on how to retrieve it from storage (whether that be local or Amazon S3 cloud storage).

28. A profile can have one attached image (optional) as an active storage blob, through active storage attachments. In this case, the single active storage blob is linked to a profile through active storage attachments. This is a one-to-one polymorphic relation.

With reference to the ERD and relations listed above, the relationships can be denoted with the following symbols with the lines connecting the two related entities as shown below:

![ERD symbol notation](./docs/ERD-Notation.png)
https://www.lucidchart.com/pages/ER-diagram-symbols-and-meaning

The symbols help represent the cardinality and ordinality of the relations. “Cardinality refers to the maximum number of times an instance in one entity can relate to instances of another entity. Ordinality, on the other hand, is the minimum number of times an instance in one entity can be associated with an instance in the related entity.” Lucidchart.com

An example of a one-to-one relationship where both sides have one and only one is the relationship between Purchases and Events. Each purchase only has one event and each event only corresponds to one purchase, and represented as such:

![only one to one](./docs/one-to-one.png)

A one-to-one relationship where one side has one and only one and optional one, is the relationship between Profiles and ActiveStorageAttachments. A profile can have one attached image, optional, and an attached image can only be associated with one and only one profile. This relationship is represented using the following notation, where a single line represents one, and the O indicates that the relationship is optional:

![only one to one optional](./docs/one-to-one-optional.png)

A one-to-many relationship where one side is has one and only one, and the other side is has many (optional), is the relationship between Users and Listings. A user can have many listings or none, but a listing belongs to one and only one user, represented by a double line for has one and only one, and a crow’s foot for many, again, the O marks the many relationship as optional:

![only one to many optional](./docs/only-one-to-many-optional.png)

A one-to-many relationship where one side is has one and only one, and the other side is has one/many is the relationship between Makes and Models. A model belongs to one and only one make, and a make can have one or many models, represented by:

![one and only one to one](./docs/one-to-onemany.png)

A one-to-many relationship where one side is has one, and the other side is has many is the relationship between Doors and BodyTypes. For example, cars with 4 doors can belong to one of the following body types (sedan, coupe, convertible, and SUV), whereas a body type can have 2 or 4 doors. This is represented by:

![one to many](./docs/one-to-many.png)

A many-to-many relationship where on side is has many (optional), and the other is has many, is the relationship between Listings and Features, through the ListingsFeatures join table. This is represented with:

![many to many](./docs/many-to-many-optional.png)

## Database Schema

The database schema is like the blueprint of how a database is constructed and shows all the relations and how data is stored in a relational database. It provides information on how tables are indexed, how tables are associated with one another through foreign keys. The schema can be altered through database migrations in which tables can be created or dropped (deleted), adding or removal of columns/attributes from tables. In practise, when dealing with an existing database, we simply can't just reset the database and start again, so adding columns and removal columns is an important skill and understanding to have. What is just as equally as important is being able to design a well structured and well-thought out database such that there shouldn't be any major alterations required, if any at all.

```ruby
create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "body_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "colours", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doors", force: :cascade do |t|
    t.integer "name"
    t.bigint "body_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body_type_id"], name: "index_doors_on_body_type_id"
  end

  create_table "drive_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "purchase_id", null: false
    t.string "name"
    t.string "address", null: false
    t.integer "postcode", null: false
    t.datetime "start_time", null: false
    t.text "message"
    t.boolean "confirmed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_id"], name: "index_events_on_purchase_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fuels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "variant_id"
    t.integer "price", null: false
    t.integer "mileage", null: false
    t.string "title"
    t.text "description"
    t.bigint "state_id", null: false
    t.integer "postcode", null: false
    t.boolean "sold", default: false
    t.integer "deposit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_listings_on_state_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
    t.index ["variant_id"], name: "index_listings_on_variant_id"
  end

  create_table "listings_features", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "feature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_id"], name: "index_listings_features_on_feature_id"
    t.index ["listing_id"], name: "index_listings_features_on_listing_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address", null: false
    t.integer "postcode", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversations_id"
    t.bigint "users_id"
    t.boolean "read", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversations_id"], name: "index_messages_on_conversations_id"
    t.index ["users_id"], name: "index_messages_on_users_id"
  end

  create_table "models", force: :cascade do |t|
    t.bigint "make_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["make_id"], name: "index_models_on_make_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "buyer_id", null: false
    t.bigint "seller_id", null: false
    t.string "payment_id"
    t.string "receipt_url"
    t.boolean "deposit_paid", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_purchases_on_buyer_id"
    t.index ["listing_id"], name: "index_purchases_on_listing_id"
    t.index ["seller_id"], name: "index_purchases_on_seller_id"
  end

  create_table "speeds", force: :cascade do |t|
    t.integer "name"
    t.bigint "transmission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transmission_id"], name: "index_speeds_on_transmission_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transmissions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_sign_in_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string "name"
    t.bigint "make_id", null: false
    t.bigint "model_id", null: false
    t.bigint "year_id", null: false
    t.bigint "engine_id", null: false
    t.bigint "speed_id", null: false
    t.bigint "fuel_id", null: false
    t.bigint "door_id", null: false
    t.bigint "body_type_id", null: false
    t.bigint "drive_type_id", null: false
    t.bigint "transmission_id", null: false
    t.bigint "colour_id", null: false
    t.decimal "displacement", precision: 2, scale: 1, null: false
    t.integer "power"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body_type_id"], name: "index_variants_on_body_type_id"
    t.index ["colour_id"], name: "index_variants_on_colour_id"
    t.index ["door_id"], name: "index_variants_on_door_id"
    t.index ["drive_type_id"], name: "index_variants_on_drive_type_id"
    t.index ["engine_id"], name: "index_variants_on_engine_id"
    t.index ["fuel_id"], name: "index_variants_on_fuel_id"
    t.index ["make_id"], name: "index_variants_on_make_id"
    t.index ["model_id"], name: "index_variants_on_model_id"
    t.index ["speed_id"], name: "index_variants_on_speed_id"
    t.index ["transmission_id"], name: "index_variants_on_transmission_id"
    t.index ["year_id"], name: "index_variants_on_year_id"
  end

  create_table "watches", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_watches_on_listing_id"
    t.index ["profile_id"], name: "index_watches_on_profile_id"
  end

  create_table "years", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "doors", "body_types"
  add_foreign_key "events", "purchases"
  add_foreign_key "listings", "states"
  add_foreign_key "listings", "users"
  add_foreign_key "listings", "variants"
  add_foreign_key "listings_features", "features"
  add_foreign_key "listings_features", "listings"
  add_foreign_key "models", "makes"
  add_foreign_key "profiles", "users"
  add_foreign_key "purchases", "listings"
  add_foreign_key "purchases", "users", column: "buyer_id"
  add_foreign_key "purchases", "users", column: "seller_id"
  add_foreign_key "speeds", "transmissions"
  add_foreign_key "variants", "body_types"
  add_foreign_key "variants", "colours"
  add_foreign_key "variants", "doors"
  add_foreign_key "variants", "drive_types"
  add_foreign_key "variants", "engines"
  add_foreign_key "variants", "fuels"
  add_foreign_key "variants", "makes"
  add_foreign_key "variants", "models"
  add_foreign_key "variants", "speeds"
  add_foreign_key "variants", "transmissions"
  add_foreign_key "variants", "years"
  add_foreign_key "watches", "listings"
  add_foreign_key "watches", "profiles"
end
```

## Task Allocation and Tracking

Tasks were tracked and allocated using the project management tool, Trello. This is a kanban ticket style app that consists of cards which can be moved between columns. Each card can be assigned a priority, Must Complete, MVP, Sprinkle, Core Feature. Each card/task is assigned a complete by or due date, checklists to break the task down into smaller steps to complete, and also activity comments and descriptions can be added to update progress about the task.

Tasks were generally assigned one of the columns depending on its status/priority, To Do, Features, Completed, Testing, Issues. Only once tasks were complete, are they moved to the Completed column.

![trello screenshot 1](./docs/trello1.png)

![trello screenshot 2](./docs/trello2.png)

![trello screenshot 3](./docs/trello3.png)

![trello screenshot 4](./docs/trello4.png)

![trello screenshot 5](./docs/trello5.png)

![trello screenshot 6](./docs/trello6.png)

### Checklist with designs/ideas for wireframes

![trello screenshot 7](./docs/trello7.png)

### Plan on how to implement logic for filtering by make

![trello screenshot 8](./docs/trello8.png)

### Plan for API, learning how to use it etc.

![trello screenshot 9](./docs/trello9.png)
