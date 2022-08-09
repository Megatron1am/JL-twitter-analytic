-- public."CUSTOMER" definition

-- Drop table

-- DROP TABLE public."CUSTOMER";

CREATE TABLE public."CUSTOMER" (
	"ID" serial4 NOT NULL,
	"CUSTOMER_NAME" varchar(1000) NULL,
	"ADDRESS_LINE_1" varchar(100) NULL,
	"ADDRESS_LINE_2" varchar(100) NULL,
	"CITY" varchar(100) NULL,
	"STATE" varchar(50) NULL,
	"ZIP" varchar(5) NULL,
	"CREATED_DATE" date NULL,
	CONSTRAINT "CUSTOMER_pkey" PRIMARY KEY ("ID")
);


-- public."CAMPAIGN" definition

-- Drop table

-- DROP TABLE public."CAMPAIGN";

CREATE TABLE public."CAMPAIGN" (
	"ID" int4 NOT NULL DEFAULT nextval('"CAMPAIGN_id_seq"'::regclass),
	"CAMPAIGN_DETAILS" varchar(1000) NULL,
	"PURPOSE" varchar(100) NULL,
	"START_DATE" date NULL,
	"CUSTOMER_ID" int4 NULL,
	"CREATED_DATE" date NULL,
	CONSTRAINT "CAMPAIGN_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT fk_cus_to_cmpn FOREIGN KEY ("CUSTOMER_ID") REFERENCES public."CUSTOMER"("ID")
);


-- public."KEYWORDS" definition

-- Drop table

-- DROP TABLE public."KEYWORDS";

CREATE TABLE public."KEYWORDS" (
	"ID" int4 NOT NULL DEFAULT nextval('"KEYWORDS_id_seq"'::regclass),
	"KEY_WORDS" varchar(1000) NULL,
	"CAMPAIGN_ID" int4 NULL,
	"CREATED_DATE" date NULL,
	CONSTRAINT "KEYWORDS_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT fk_cus_to_cmpn FOREIGN KEY ("CAMPAIGN_ID") REFERENCES public."CAMPAIGN"("ID")
);


-- public."TWEETS" definition

-- Drop table

-- DROP TABLE public."TWEETS";

CREATE TABLE public."TWEETS" (
	"ID" int4 NOT NULL DEFAULT nextval('tweets_id_seq'::regclass),
	"TWEET_TEXT" varchar(1000) NULL,
	"KEYWORD_ID" int4 NULL,
	"CREATED_DATE" date NULL,
	CONSTRAINT tweets_pkey PRIMARY KEY ("ID"),
	CONSTRAINT fk_keywords_to_tweets FOREIGN KEY ("KEYWORD_ID") REFERENCES public."KEYWORDS"("ID")
);


-- public."TWEET_DETAILS" definition

-- Drop table

-- DROP TABLE public."TWEET_DETAILS";

CREATE TABLE public."TWEET_DETAILS" (
	"TEXT" varchar(1000) NULL,
	"POLARITY" float4 NULL,
	"SUBJECTIVITY" float4 NULL,
	"SENTIMENT" varchar(50) NULL,
	"NEGATIVE" float4 NULL,
	"NEUTRAL" float4 NULL,
	"POSITIVE" float4 NULL,
	"COMPOUND" float4 NULL,
	"PUNCTUATION" varchar(256) NULL,
	"TOKENIZED" varchar(256) NULL,
	"NONSTOP" varchar(256) NULL,
	"STEMMED" varchar(256) NULL,
	"TWEET_ID" int4 NULL,
	CONSTRAINT fk_td_to_tweets FOREIGN KEY ("TWEET_ID") REFERENCES public."TWEETS"("ID")
);


-- public."TWEET_LIST" definition

-- Drop table

-- DROP TABLE public."TWEET_LIST";

CREATE TABLE public."TWEET_LIST" (
	"TEXT" varchar(256) NULL,
	"POLARITY" float4 NULL,
	"SUBJECTIVITY" float4 NULL,
	"SENTIMENT" varchar(50) NULL,
	"NEGATIVE" float4 NULL,
	"NEUTRAL" float4 NULL,
	"POSITIVE" float4 NULL,
	"COMPOUND" float4 NULL,
	"TWEET_ID" int4 NULL,
	"CREATED_DATE" date NULL,
	CONSTRAINT fk_tl_to_tweets FOREIGN KEY ("TWEET_ID") REFERENCES public."TWEETS"("ID")
);


-- public."TWEET_SENTIMENTS" definition

-- Drop table

-- DROP TABLE public."TWEET_SENTIMENTS";

CREATE TABLE public."TWEET_SENTIMENTS" (
	"TEXT" varchar(256) NULL,
	"POLARITY" float4 NULL,
	"SUBJECTIVITY" float4 NULL,
	"SENTIMENTS" varchar(50) NULL,
	"NEGETIVE" float4 NULL,
	"NEUTRAL" float4 NULL,
	"POSITIVE" float4 NULL,
	"COMPOUND" float4 NULL,
	"PUNCTUATION" varchar(256) NULL,
	"TOKENIZED" varchar(256) NULL,
	"NON_STOP" varchar(256) NULL,
	"STEMMED" varchar(256) NULL,
	"TWEET_ID" int4 NULL,
	"CREATED_DATE" date NULL,
	CONSTRAINT fk_ts_to_tweets FOREIGN KEY ("TWEET_ID") REFERENCES public."TWEETS"("ID")
);