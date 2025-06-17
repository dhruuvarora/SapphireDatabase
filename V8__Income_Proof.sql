CREATE TYPE income_proof_type_enum AS ENUM (
    'bank_statement_6m_10k',
    'salary_slip_15k_monthly', 
    'form_16_120k_annual',
    'net_worth_certificate_10l',
    'demat_statement_10k_holdings'
);

ALTER TABLE signup_checkpoints
    ADD COLUMN income_proof TEXT;

ALTER TABLE signup_verification_status
    ADD COLUMN income_proof_status compliance_verification_status NOT NULL DEFAULT 'processing';

ALTER TABLE signup_checkpoints
    ADD COLUMN esign               TEXT,
    ADD COLUMN pan_document        TEXT,
    ADD COLUMN pan_document_issuer VARCHAR(100);

ALTER TABLE "user"
    ADD COLUMN esign               TEXT,
    ADD COLUMN pan_document        TEXT,
    ADD COLUMN pan_document_issuer VARCHAR(100);

ALTER TABLE signup_checkpoints
    ADD COLUMN income_proof_type income_proof_type_enum;

ALTER TABLE "user"
    ADD COLUMN income_proof_type income_proof_type_enum;