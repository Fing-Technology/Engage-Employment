﻿ALTER TABLE [dotnetnuke_dukes].[dnn_EngageEmployment_lkpCommonWords]
    ADD CONSTRAINT [dnn_IX_EngageEmployment_lkpCommonWords_Word] UNIQUE NONCLUSTERED ([Word] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

