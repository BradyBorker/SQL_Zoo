-- Show the the percentage who STRONGLY AGREE

SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

-- Show the institution and subject where the score is at least 100 for question 15.

SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >= 100;

-- Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'

SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
   AND score < 50;

-- Show the subject and total number of students who responded to question 22 for each of the subjects 
-- '(8) Computer Science' and '(H) Creative Arts and Design'.

SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject

-- Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for 
-- each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.

SELECT subject, SUM(response*A_STRONGLY_AGREE/100)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject

-- Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject 
-- '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.
