-- Table: public.congressionalsessions

-- DROP TABLE IF EXISTS public.congressionalsessions;

CREATE TABLE IF NOT EXISTS public.congressionalsessions
(
    sessionnumber integer,
    sessionstartedon date,
    sessionendedon date,
    membercount integer,
    nonvoting integer,
    majority character varying COLLATE pg_catalog."default",
    speaker_id character varying COLLATE pg_catalog."default",
    housespeaker character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.congressionalsessions
    OWNER to postgres;

-- Table: public.housemembers

-- DROP TABLE IF EXISTS public.housemembers;

CREATE TABLE IF NOT EXISTS public.housemembers
(
    uniqueid character varying COLLATE pg_catalog."default" NOT NULL,
    govnurl character varying COLLATE pg_catalog."default",
    fullname character varying COLLATE pg_catalog."default",
    firstname character varying COLLATE pg_catalog."default",
    lastname character varying COLLATE pg_catalog."default",
    gender character varying COLLATE pg_catalog."default",
    dob date,
    party character varying COLLATE pg_catalog."default",
    houseterms character varying COLLATE pg_catalog."default",
    state character varying COLLATE pg_catalog."default",
    stateabr character varying COLLATE pg_catalog."default",
    district integer,
    combstatedistrict character varying COLLATE pg_catalog."default",
    statedistid character varying COLLATE pg_catalog."default",
    firstsession character varying COLLATE pg_catalog."default",
    secondsession character varying COLLATE pg_catalog."default",
    thirdsession character varying COLLATE pg_catalog."default",
    congress109 integer,
    congress110 integer,
    congress111 integer,
    congress112 integer,
    congress113 integer,
    congress114 integer,
    congress115 integer,
    congress116 integer,
    congress117 integer,
    congress118 integer,
    CONSTRAINT housemembers_pkey PRIMARY KEY (uniqueid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.housemembers
    OWNER to postgres;

-- Table: public.twitterhandles

-- DROP TABLE IF EXISTS public.twitterhandles;

CREATE TABLE IF NOT EXISTS public.twitterhandles
(
    uniqueid character varying COLLATE pg_catalog."default" NOT NULL,
    fullname character varying COLLATE pg_catalog."default",
    twitterhandle character varying COLLATE pg_catalog."default",
    joinedon date,
    yearjoined integer,
    createdaftersession bit(1),
    yraftertwitter integer,
    CONSTRAINT "TwitterHandles_pkey" PRIMARY KEY (uniqueid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.twitterhandles
    OWNER to postgres;