# **EzLC Project Report**

## **Problem Statement**

Competitive programming and technical interview preparation require mastering a wide variety of data structures and algorithmic (DSA) problems. However, platforms like LeetCode offer thousands of problems without a consistent or structured classification system, making it hard for learners to identify patterns, build a roadmap, or assess progress across concepts. There is a clear need for an intelligent system that categorizes DSA problems into well-defined patterns and subpatterns to enable targeted learning.

---

## **Background**

While existing platforms allow filtering by tags or difficulty, these categories are often broad, inconsistent, or insufficient for structured learning. Learners often resort to community-curated lists or spreadsheets, which are static and quickly become outdated. Recent advances in Natural Language Processing (NLP) and transfer learning allow for a more scalable and intelligent solution—automatically categorizing problems using semantic understanding of their problem statements.

---

## **Methodology**

1. **Data Collection**: Scraped ~3450 LeetCode problems including titles, descriptions, difficulty, and tags.
3. **Hierarchical Categorization**:
   - Designed a three-level category system: **Pattern → Subpattern → Specific Type**.
   - Used Gemini Flash 2.0 to label problems at each level.
   - Fine-tuned a BERT-based classifier (or used transfer learning) in a *cascade architecture* to predict category levels sequentially.
4. **Frontend**: Developed a web interface using **Next.js App Router**, displaying problems in a dynamic nested structure based on the category hierarchy stored in a JSON file.

---

## **Functionality**

- Users can:
  - Browse problems by pattern or subpattern.
  - View the full problem statement and metadata.
  - Search or filter based on difficulty or category.
  - Explore relationships between patterns and problem-solving techniques.


---

## **Advantages**

- **Structured Learning**: Enables users to master DSA concepts progressively.
- **Scalability**: Model-based categorization can scale with new problems.
- **Dynamic Interface**: Intuitive navigation through hierarchical categories.

---

## **Future Prospect**

- Add user accounts and progress tracking.
- Introduce personalized roadmaps using AI.
- Enable problem recommendations based on performance.
- Expand to other platforms like Codeforces, AtCoder, etc.

---

## **Conclusion**

EzLC bridges a critical gap in DSA preparation by offering a structured, scalable, and intelligent categorization of LeetCode problems. Through a combination of NLP techniques, dynamic frontend development, and thoughtful design, the platform transforms the way learners engage with competitive programming content—making practice more purposeful, efficient, and aligned with real-world interview expectations.
