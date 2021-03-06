-- Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
-- $Id$
--
-- Sequences for ProjEx Models
--
-- * All sequences are unique for all sites.
--
-- * The five lower order digits are reserved for site and type.
-- * For now, we only have one site, so the lowest order digits are
--   reserved for type and the site is 0.
-- * CACHE 1 is required, because postgres keeps the cache on the
--   client side
--
----------------------------------------------------------------
--
-- Starting at 21.  1-20 is reserved for bOP common Models.
--
