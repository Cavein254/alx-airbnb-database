# 3NF Normalization Analysis for ERD

## ✅ Third Normal Form (3NF) Normalization Analysis

### 💡 Definition Recap

A schema is in:

- **1NF**: if all attributes have atomic values.
- **2NF**: if it's in 1NF and all non-key attributes are fully functionally dependent on the primary key.
- **3NF**: if it's in 2NF and no transitive dependencies exist between non-key attributes.

---

## 🔍 Entity-by-Entity Normalization Review

### 1. User Table

**Attributes**: `user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at`

- ✅ 1NF: All fields atomic.
- ✅ 2NF: All non-key attributes depend on `user_id`.
- ✅ 3NF: No transitive dependencies.

**✅ Already in 3NF**

---

### 2. Property Table

**Attributes**: `property_id (PK), host_id (FK), name, description, location, pricepernight, created_at, updated_at`

- ✅ All fields atomic.
- ✅ All non-key attributes depend on `property_id`.
- ✅ No transitive dependency.

**✅ Already in 3NF**

---

### 3. Booking Table

**Attributes**: `booking_id (PK), property_id (FK), user_id (FK), start_date, end_date, total_price, status, created_at`

- ✅ All fields atomic.
- ✅ All non-key attributes are dependent on `booking_id`.
- ✅ No transitive dependency.

**✅ Already in 3NF**

---

### 4. Payment Table

**Attributes**: `payment_id (PK), booking_id (FK), amount, payment_date, payment_method`

- ✅ Atomic fields
- ✅ Full dependency on `payment_id`
- ✅ No transitive dependencies

**✅ Already in 3NF**

---

### 5. Review Table

**Attributes**: `review_id (PK), property_id (FK), user_id (FK), rating, comment, created_at`

- ✅ Atomic
- ✅ All attributes depend on `review_id`
- ✅ No transitive dependency

**✅ Already in 3NF**

---

### 6. Message Table

**Attributes**: `message_id (PK), sender_id (FK), recipient_id (FK), message_body, send_at`

- ✅ All atomic
- ✅ Depend fully on `message_id`
- ✅ No transitive dependencies

**✅ Already in 3NF**

---

## ✅ Summary

| Table    | In 3NF? | Reason                                       |
| -------- | ------- | -------------------------------------------- |
| User     | ✅      | No transitive dependencies                   |
| Property | ✅      | Fully normalized                             |
| Booking  | ✅      | All non-key attributes depend directly on PK |
| Payment  | ✅      | No partial/transitive dependency             |
| Review   | ✅      | Compliant with 3NF                           |
| Message  | ✅      | Well-structured                              |

---

## 🛠 Suggested Improvements (Optional Enhancements)

These aren't required by 3NF, but may improve design:

1. **Location Normalization**: Extract `location` into a separate table (`Location` with city, state, country).
2. **Payment Method Enum**: Consider using a `payment_methods` table for extensibility.
3. **Role Enum**: Like above, a `roles` table might provide flexibility if more roles are added in future.

---

## 📄 Conclusion

All tables in your ERD are already in **Third Normal Form (3NF)** based on the standard rules of normalization. You may consider optional enhancements for extensibility and clarity, especially around enums and locations.
"""
