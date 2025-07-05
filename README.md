
# Expense Tracker App

An easy-to-use web application for tracking your personal and shared expenses. This project is designed to help individuals and groups manage their finances by recording transactions, categorizing expenses, and monitoring spending trends over time.

## Features

- **User Authentication:** Sign up, log in, and secure your data.
- **Add & Manage Expenses:** Record expenses with details like amount, category, description, and date.
- **Expense Categories:** Organize spending into custom or predefined categories.
- **View Expense History:** See a list or graph of all your past expenses.
- **Analytics Dashboard:** Visualize spending patterns with charts and summaries.
- **Edit & Delete Transactions:** Modify or remove erroneous entries easily.
- **Responsive Design:** Works on desktop and mobile devices.
- **(Optional) Multi-user or Group Support:** Track shared expenses with friends, family, or roommates.

## Tech Stack

- **Frontend:** React.js
- **Backend:** Node.js, Express.js
- **Database:** MongoDB
- **Authentication:** JWT (JSON Web Tokens)
- **Styling:** CSS/SCSS or a component library (e.g., Material UI)

## Getting Started

### Prerequisites

- Node.js (v14+)
- npm or yarn
- MongoDB (local or cloud, e.g., MongoDB Atlas)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Parvagarwal19/Devsoc-core-project.git
   cd Devsoc-core-project
   ```

2. **Install backend dependencies**
   ```bash
   cd backend
   npm install
   ```

3. **Install frontend dependencies**
   ```bash
   cd ../frontend
   npm install
   ```

4. **Set up environment variables**

   - Create a `.env` file in the backend directory. Example:
     ```
     MONGO_URI=your_mongodb_connection_string
     JWT_SECRET=your_jwt_secret
     PORT=5000
     ```

5. **Start the backend server**
   ```bash
   cd backend
   npm start
   ```

6. **Start the frontend**
   ```bash
   cd ../frontend
   npm start
   ```

7. The app should now be running at [http://localhost:3000](http://localhost:3000).

## Usage

- Register for a new account or log in with existing credentials.
- Add your expenses using the "Add Expense" form.
- View, filter, and analyze your expenses by category or date range.
- Edit or delete expenses as needed.
- (If group features are available) Create or join groups to track shared expenses.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a new Pull Request

## License

This project is licensed under the MIT License.

## Contact

For questions or collaboration, please contact [Parvagarwal19](https://github.com/Parvagarwal19).








