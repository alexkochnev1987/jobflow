INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  ('published', 1, 5, 'At a party do you:', 'mbti');

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Interact with many, including strangers',
    'E'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Interact with a few, known to you',
    'I'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  ('published', 2, 5, 'Are you more:', 'mbti');

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Realistic than speculative',
    'S'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Speculative than realistic',
    'N'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  ('published', 3, 5, 'Is it worse to:', 'mbti');

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Have your "head in the clouds"',
    'S'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Be "in a rut"',
    'N'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    4,
    5,
    'Are you more impressed by:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Principles',
    'T'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  ('published', 2, '2', @questionID, 'Emotions', 'F');

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    5,
    5,
    'Are more drawn toward the:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Convincing',
    'T'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  ('published', 2, '2', @questionID, 'Touching', 'F');

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    6,
    5,
    'Do you prefer to work:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'To deadlines',
    'J'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Just "whenever"',
    'P'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    7,
    5,
    'Do you tend to choose:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Rather carefully',
    'J'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Somewhat impulsively',
    'P'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  ('published', 8, 5, 'At parties do you:', 'mbti');

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Stay late, with increasing energy',
    'E'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Leave early with decreased energy',
    'I'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    9,
    5,
    'Are you more attracted to:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Sensible people',
    'S'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Imaginative people',
    'N'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    10,
    5,
    'Are you more interested in:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'What is actual',
    'S'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'What is possible',
    'N'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    11,
    5,
    'In judging others are you more swayed by:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Laws than circumstances',
    'T'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Circumstances than laws',
    'F'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    12,
    5,
    'In approaching others is your inclination to be somewhat:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Objective',
    'T'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  ('published', 2, '2', @questionID, 'Personal', 'F');

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  ('published', 13, 5, 'Are you more:', 'mbti');

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  ('published', 1, '1', @questionID, 'Punctual', 'J');

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Leisurely',
    'P'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    14,
    5,
    'Does it bother you more having things:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Incomplete',
    'P'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Completed',
    'J'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    15,
    5,
    'In your social groups do you:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Keep abreast of other’s happenings',
    'E'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Get behind on the news',
    'I'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    16,
    5,
    'In doing ordinary things are you more likely to:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Do it the usual way',
    'S'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Do it your own way',
    'N'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  ('published', 17, 5, 'Writers should:', 'mbti');

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    '“Say what they mean and mean what they say”',
    'S'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Express things more by use of analogy',
    'N'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    18,
    5,
    'Which appeals to you more:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Consistency of thought',
    'T'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Harmonious human relationships',
    'F'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    19,
    5,
    'Are you more comfortable in making:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Logical judgments',
    'T'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Value judgments',
    'F'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    20,
    5,
    'Do you want things:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Settled and decided',
    'J'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Unsettled and undecided',
    'P'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  (
    'published',
    21,
    5,
    'Would you say you are more:',
    'mbti'
  );

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Serious and determined',
    'J'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Easy-going',
    'P'
  );

INSERT INTO
  EvaluationFormQuestion (status, sort, step, question, `type`)
VALUES
  ('published', 22, 5, 'In phoning do you:', 'mbti');

SET
  @questionID = LAST_INSERT_ID();

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    1,
    '1',
    @questionID,
    'Rarely question that it will all be said',
    'P'
  );

INSERT INTO
  EvaluationFormAnswer (status, sort, value, question, label, letter)
VALUES
  (
    'published',
    2,
    '2',
    @questionID,
    'Rehearse what you’ll say',
    'J'
  );



  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 23, 5, 'Facts:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter) 
    VALUES ('published', 1, '1', @questionID, '“Speak for themselves”', 'S');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'Illustrate principles', 'N');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 24, 5, 'Are visionaries:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'somewhat annoying', 'S');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'rather fascinating', 'N');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 25, 5, 'Are you more often:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'a cool-headed person', 'T');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'a warm-hearted person', 'F');


  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 26, 5, 'Is it worse to be:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'unjust', 'F');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'merciless', 'T');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 27, 5, 'Should one usually let events occur:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'by careful selection and choice', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'randomly and by chance', 'P');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 28, 5, 'Do you feel better about:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'having purchased', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'having the option to buy', 'P');

  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 26, 5, 'Is it worse to be:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'unjust', 'F');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'merciless', 'T');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 27, 5, 'Should one usually let events occur:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'by careful selection and choice', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'randomly and by chance', 'P');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 28, 5, 'Do you feel better about:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'having purchased', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'having the option to buy', 'P');


  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 32, 5, 'In making decisions do you feel more comfortable with:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'standards', 'T');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'feelings', 'F');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 33, 5, 'Are you more:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'firm than gentle', 'T');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'gentle than firm', 'F');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 34, 5, 'Which is more admirable:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter) 
    VALUES ('published', 1, '1', @questionID, 'the ability to organize and be methodical', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'the ability to adapt and make do', 'P');

  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 35, 5, 'Do you put more value on:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'infinite', 'N');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'open-minded', 'S');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 36, 5, 'Does new and non-routine interaction with others:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'stimulate and energize you', 'E');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'tax your reserves', 'I');
  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 37, 5, 'Are you more frequently:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'a practical sort of person', 'S');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'a fanciful sort of person', 'N');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 38, 5, 'Are you more likely to:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'see how others are useful', 'T');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'see how others see', 'F');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 39, 5, 'Which is more satisfying:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'to discuss an issue thoroughly', 'T');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'to arrive at agreement on an issue', 'F');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 40, 5, 'Which rules you more:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'your head', 'T');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'your heart', 'F');

  INSERT INTO EvaluationFormQuestion 
    (status, sort, step, question, `type`)
    VALUES ('published', 40, 5, 'Which rules you more:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'your head', 'T');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'your heart', 'F');
  

  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 41, 5, 'Are you more comfortable with work that is:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'contracted', 'J');  

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter) 
    VALUES ('published', 2, '2', @questionID, 'done on a casual basis', 'P');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 42, 5, 'Do you tend to look for:', 'mbti');
  
  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'the orderly', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)  
    VALUES ('published', 2, '2', @questionID, 'whatever turns up', 'P');


  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 42, 5, 'Do you tend to look for:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)  
    VALUES ('published', 1, '1', @questionID, 'the orderly', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)  
    VALUES ('published', 2, '2', @questionID, 'whatever turns up', 'P');


  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 43, 5, 'Do you prefer:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'many friends with brief contact', 'E');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter) 
    VALUES ('published', 2, '2', @questionID, 'a few friends with more lengthy contact', 'I');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 44, 5, 'Do you go more by:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'facts', 'S');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'principles', 'N');

  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 45, 5, 'Are you more interested in:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'production and distribution', 'S');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'design and research', 'N');


  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 46, 5, 'Which is more of a compliment:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, '“There is a very logical person.”', 'T');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, '“There is a very sentimental person.”', 'F');


  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 47, 5, 'Do you value in yourself more that you are:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'unwavering', 'J');

  INSERT INTO EvaluationFormAnswer 
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'devoted', 'P');

  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 48, 5, 'Do you more often prefer the:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)  
    VALUES ('published', 1, '1', @questionID, 'final and unalterable statement', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 2, '2', @questionID, 'tentative and preliminary statement', 'P');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 49, 5, 'Are you more comfortable:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'after a decision', 'J');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)  
    VALUES ('published', 2, '2', @questionID, 'before a decision', 'P');

  
  INSERT INTO EvaluationFormQuestion
    (status, sort, step, question, `type`)
    VALUES ('published', 50, 5, 'Do you:', 'mbti');

  SET @questionID = LAST_INSERT_ID();

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter)
    VALUES ('published', 1, '1', @questionID, 'speak easily and at length with strangers', 'E');

  INSERT INTO EvaluationFormAnswer
    (status, sort, value, question, label, letter) 
    VALUES ('published', 2, '2', @questionID, 'find little to say to strangers', 'I');
