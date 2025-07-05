const express = require("express");
const router = express.Router();
const Expense = require("../models/Expense");
const authMiddleware = require("../middleware/authMiddleware");

// GET all expenses for the logged-in user
router.get("/", authMiddleware, async (req, res) => {
  try {
    const expenses = await Expense.find({ userId: req.user.userId }).sort({ date: -1 });
    res.json(expenses);
  } catch (err) {
    res.status(500).json({ message: "Error fetching expenses" });
  }
});

// POST a new expense for the logged-in user
router.post("/", authMiddleware, async (req, res) => {
  const { title, amount, category, date } = req.body;

  if (!title || !amount || !category || !date) {
    return res.status(400).json({ message: "All fields are required." });
  }

  try {
    const newExpense = new Expense({
      title,
      amount,
      category,
      date: new Date(date),
      userId: req.user.userId, // 👈 attach logged-in user
    });

    await newExpense.save();
    res.status(201).json(newExpense);
  } catch (err) {
    res.status(500).json({ message: "Failed to save expense" });
  }
});

module.exports = router;
