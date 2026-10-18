# Final Report: Credit Card Fraud Detection

## 1. Project Overview

The goal of this project is to identify fraudulent credit-card
transactions using machine-learning classification. The notebook uses
the `Class` column as the target:

-   **Class 0:** Legitimate transaction
-   **Class 1:** Fraudulent transaction

The dataset contains **284,807 transactions** and **30 input features**.
It is highly imbalanced: 284,315 transactions (99.8273%) are legitimate
and only 492 (0.1727%) are fraudulent. Because fraud is rare, accuracy
alone is not enough to evaluate the model.

## 2. Data Preparation

The notebook follows these main preparation steps:

1.  Separates the input features from the target `Class` column.
2.  Splits the data into training and test sets using an 80:20 split,
    `random_state=42`, and stratification to preserve the class
    proportions.
3.  Scales the `Time` and `Amount` columns using `StandardScaler`,
    fitting the scaler on the training data and applying it to the test
    data.
4.  Uses **SMOTE** on the training set to balance the classes. The
    training set changes from 227,451 legitimate and 394 fraudulent
    examples to 227,451 examples in each class. The test set is left
    unchanged so evaluation reflects the original class imbalance.

## 3. Why Random Forest Was Chosen

The notebook trains and compares two models: Logistic Regression and
Random Forest. Random Forest was selected because it provides a much
stronger overall balance between detecting fraud and avoiding false
alarms on this test set.

  Metric for the Fraud class     Logistic Regression   Random Forest
  ---------------------------- --------------------- ---------------
  Precision                                     0.06            0.85
  Recall                                        0.92            0.84
  F1-score                                      0.11            0.84

**Reasons for choosing Random Forest:**

-   **Much higher precision:** Random Forest's fraud precision is 0.85,
    compared with 0.06 for Logistic Regression. In this evaluation, a
    fraud prediction from Random Forest is much more likely to be
    correct.
-   **Strong recall:** Random Forest detects 83.67% of the actual fraud
    cases in the test set. Logistic Regression's recall is slightly
    higher, but its very low precision means it flags many legitimate
    transactions as fraud.
-   **Better balance:** Random Forest has an F1-score of 0.84 for fraud,
    compared with 0.11 for Logistic Regression. The F1-score combines
    precision and recall, so it helps show the balance between finding
    fraud and limiting false alarms.
-   **Useful on this dataset:** Random Forest can learn more complex
    patterns and interactions between features than a simple linear
    decision boundary. This is a general advantage of the method; the
    model comparison in this notebook is the direct evidence for its
    selection here.

The notebook's Random Forest confusion-matrix results are:

-   **True negatives:** 56,849 legitimate transactions correctly
    identified.
-   **False positives:** 15 legitimate transactions incorrectly flagged
    as fraud.
-   **False negatives:** 16 fraud transactions missed.
-   **True positives:** 82 fraud transactions correctly detected.

These results support selecting Random Forest for this project because
it detects most fraud cases while producing far fewer false alarms than
Logistic Regression in the notebook's test results.

## 4. What the Recall Score Means

**Recall measures the proportion of all actual fraud transactions that
the model successfully identifies as fraud.**

The formula is:

\[ `\text{Recall}`{=tex} =
`\frac{\text{True Positives}}{\text{True Positives}+\text{False Negatives}}`{=tex}
\]

For Random Forest in this notebook:

-   True positives (fraud detected) = **82**
-   False negatives (fraud missed) = **16**
-   Total actual fraud cases in the test set = **98**

Therefore:

\[ `\text{Recall}`{=tex} = `\frac{82}{82+16}`{=tex} =
`\frac{82}{98}`{=tex} `\approx 0.8367`{=tex} \]

The Random Forest fraud recall is **0.8367, or 83.67%**.

**In simple words:** out of 98 real fraud transactions in the test set,
the model detected 82 and missed 16. A recall of 83.67% means it found
about 84 out of every 100 actual fraud cases in this evaluation.

Recall is especially important in fraud detection because a missed
fraudulent transaction may cause financial loss. However, recall should
not be considered alone: a model can increase recall by flagging too
many legitimate transactions. Precision, the F1-score, and the confusion
matrix help assess that trade-off.

## 5. Business Impact Observed in the Notebook

The notebook reports the following results for Random Forest on the test
set:

-   **Fraud detection rate:** 83.67%
-   **Value of detected fraud transactions:** 6,813.48
-   **Value of missed fraud transactions:** 3,831.45
-   **Legitimate transactions incorrectly flagged:** 15

The amounts are reported in the dataset's transaction-amount units. They
are not, by themselves, proof of money recovered or losses prevented;
they represent the transaction values associated with detected and
missed fraud cases in the test data.

## 6. Model Saving and Verification

The notebook saves the trained Random Forest model, the fitted scaler,
and the feature list. It then reloads the saved model and verifies that
its predictions match the original Random Forest predictions. The
notebook reports **"Predictions match: True"** and **"Saved model
verification passed."**

## 7. Conclusion

Random Forest was chosen because it achieved a strong balance of fraud
precision (0.85), recall (83.67%), and F1-score (0.84) in the notebook's
test evaluation. Its recall means that it detected 82 of the 98 actual
fraud transactions, while missing 16. Compared with Logistic Regression,
it produced far fewer false alarms and a much stronger F1-score, making
it the better-performing choice for this notebook's results.

These results are from one train/test split and should not be treated as
a guarantee of future performance. Before real-world deployment, the
model should be validated on newer transactions and monitored for
changes in fraud patterns.
