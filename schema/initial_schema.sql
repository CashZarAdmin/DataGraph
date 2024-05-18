-- id is "todays' date + hours of the day + (turnicated of the first 10 chracters of sha 256 of uuuid of any object)

CREATE TABLE types (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    attributes JSONB NOT NULL,
    description TEXT
);
CREATE TABLE operational_entities (
    id VARCHAR(20) PRIMARY KEY,
    entity_type INT REFERENCES types(id),
    attributes JSONB NOT NULL
);


CREATE TABLE financial_entities (
    id VARCHAR(20) PRIMARY KEY,
    attributes JSONB NOT NULL,
    entity_type INT REFERENCES types(id),
);
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712d2d2d2d2d2','Employee','employee schema','{"id":"f47ac10b-58cc-4372-a567-0e02b2c3d479","name":"Employee","description":"Employee Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Employee","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the entry."},"employee_id":{"type":"string","description":"Unique identifier for the employee."},"first_name":{"type":"string","description":"First name of the employee."},"last_name":{"type":"string","description":"Last name of the employee."}},"required":["id","employee_id","first_name","last_name"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024051712ff6430adff','2024051712d2d2d2d2d2','{"id":"550e8400-e29b-41d4-a716-446655440000","first_name":"Bahador","last_name":"Biglari","employee_id":1}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240517129d8c27b29d','2024051712d2d2d2d2d2','{"id":"6a447c78-cb8b-4076-b4ab-b1c64a3e16d2","first_name":"Farzad","last_name":"Qassemi","employee_id":2}');




INSERT INTO types (id, name, description, attributes) VALUES ('2024051712c4a8b7e1d2','1 - Assets - Current','Current asset from BalanceSheet','{"id":"ab2f29a1-97d3-4c62-81b9-0f3f6a1b2c45","name":"Assets - Current","description":"Assets - Current Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Assets - Current","type":"object","properties":{"assets_current":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the current asset entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["assets_current"]}}');

INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722ec95dd8880','2024051712c4a8b7e1d2','{"id":"b5e53006-50b6-4773-b923-7b647cc953ce","account_number":"1100","account_name":"Cash in Bank","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('202405172210e93dd4bf','2024051712c4a8b7e1d2','{"id":"4b61e983-c6a0-4a7a-9a2b-62b3fbbef0bd","account_number":"1201","account_name":"Undeposited Funds","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722190b8226a8','2024051712c4a8b7e1d2','{"id":"6bbdf823-335e-4cff-b262-a16e7eb3d7ca","account_number":"1202","account_name":"Accounts Receivables (AR)","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517225d26dd9fd6','2024051712c4a8b7e1d2','{"id":"3cb397b5-3bb0-43af-a4b7-4a3055a84955","account_number":"1203","account_name":"Prepaid","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712c4a8b7e1d2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');




INSERT INTO types (id, name, description, attributes) VALUES ('2024051712b5e6a3c4d7','1 - Assets - Long Term','Long term asset from BalanceSheet','{"id":"f3e9c2f1-18b4-4eb2-bd8e-1c3a6b2e4d9f","name":"Assets - Long Term","description":"Assets - Long Term Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Assets - Long Term","type":"object","properties":{"assets_long_term":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the long term asset entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["assets_long_term"]}}');

INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722dde5799bdb','2024051712b5e6a3c4d7','{"id":"22ad6818-8a8e-4f22-b56e-84a1470fe1a0","account_number":"1400","account_name":"Term Assets","control_group":"Assets - Long Term","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517222c79426d54','2024051712b5e6a3c4d7','{"id":"f54e8155-7793-49c3-b4e8-2f8aef6b089b","account_number":"1499","account_name":"Other Current Assets","control_group":"Assets - Long Term","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722fe71abb2f2','2024051712b5e6a3c4d7','{"id":"8dd07bbc-91b9-40cd-80b0-a24f8dd8e5c7","account_number":"1510","account_name":"Fixed Assets (Including Depreciation)","control_group":"Assets - Long Term","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517220e67019ee2','2024051712b5e6a3c4d7','{"id":"f1ea4ba1-df15-4f88-9df7-0ee25aa47829","account_number":"1520","account_name":"Other Long Term Assets","control_group":"Assets - Long Term","type":"Balance Sheet"}');


INSERT INTO types (id, name, description, attributes) VALUES ('2024051712e8a7d6b1c2','2 - Liabilities - Current','Current liabilities from BalanceSheet','{"id":"471d6e8c-14b3-4d29-8e1f-2b8e5c3a6b9e","name":"Liabilities - Curren","description":"Liabilities - Curren Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Liabilities - Current","type":"object","properties":{"liabilities_current":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the current liability entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["liabilities_current"]}}');


INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712e8a7d6b1c2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');





INSERT INTO types (id, name, description, attributes) VALUES ('2024051712a1d4b7c9e5','2 - Liabilities - Long Term','Long Term liabilities from BalanceSheet','{"id":"d4b5f7c1-2e4f-4c69-87b0-4f5a6e3c8d9f","name":"Liabilities - Long Term","description":"Liabilities - Long Term Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Liabilities - Long Term","type":"object","properties":{"liabilities_long_term":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the long term liability entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["liabilities_long_term"]}}}');
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712b7a8d9c1e2','3 - Equity','Equity from BalanceSheet','{"id":"c3e8d7a5-16b4-4e8a-9d1f-5e2b6a7c8e1d","name":"Equity","description":"Equity Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Equity","type":"object","properties":{"equity":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the equity entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["equity"]}}');
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712d5a7c8b9e0','4 - Revenue','Revenue from P&L','{"id":"9b5d4e3c-76b4-4a6e-9b1a-6f8c7d5a1b9e","name":"Revenue","description":"Revenue Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Revenue","type":"object","properties":{"revenue":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the revenue entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["revenue"]}}');



INSERT INTO types (id, name, description, attributes) VALUES ('2024051712bb1c45b9bb','COGS','cost of good and services','{"id":"6fa459ea-ee8a-3ca4-894e-db77e160355e","name":"COGS","description":"COGS Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Cost of Goods Sold","type":"object","properties":{"cogs":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the COGS entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."},"amount":{"type":"number","description":"Amount associated with this account in the COGS."}},"required":["id","account_id","account_name","type","control_group","amount"]}}},"required":["cogs"]}}');

INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712a7b8c9d4a7','2024051712bb1c45b9bb','{"id":"b34bf854-c5db-49e3-ae3f-40d78998d957","account_number":"5100","account_name":"Employee Cost","control_group":"COGS","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712e4f5d6c7e4','2024051712bb1c45b9bb','{"id":"8d4aab76-9816-4b4a-8037-38d5f1f23b69","account_number":"5200","account_name":"Contractors COGS (1099s)","control_group":"COGS","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('202405171267e89a8d67','2024051712bb1c45b9bb','{"id":"afe1b43b-49b0-4d2c-8fd7-7b7611f0e127","account_number":"5300","account_name":"Travel COGS","control_group":"COGS","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('202405171259b9fa7e8c','2024051712bb1c45b9bb','{"id":"a3bb189e-8bf9-3888-9912-ace4e6543002","account_number":"5600","account_name":"Infrastructure Technology (Hosting & Other Subscriptions)","control_group":"COGS","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712a93d0af8e1','2024051712bb1c45b9bb','{"id":"3e0a2d6a-e69b-4b9a-8c7e-45f15d56de13","account_number":"5900","account_name":"Other COGS","control_group":"COGS","type":"P&L"}');


INSERT INTO types (id, name, description, attributes) VALUES ('202405171217f5b6a217','OPEX','operating expense','{"id":"123e4567-e89b-12d3-a456-426614174000","name":"OPEX","description":"OPEX Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Operating Expenses","type":"object","properties":{"opex":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the OPEX entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."},"amount":{"type":"number","description":"Amount associated with this account in the OPEX."}},"required":["id","account_id","account_name","type","control_group","amount"]}}},"required":["opex"]}}');

INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712c7f1b28c16','202405171217f5b6a217','{"id":"dc6807f1-1aaf-44bc-b3a8-9e540b805c36","account_number":"6100","account_name":"Employee Cost OPEX (W2s) - Generic","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712fd87c1214e','202405171217f5b6a217','{"id":"9d5b51c5-158b-4b12-81e7-8b9c9dbaac3e","account_number":"6200","account_name":"Professional Services (1099s) - Generic","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517128493f5b6c9','202405171217f5b6a217','{"id":"e7a1f3b7-d86c-499a-a64a-4d16ab1f9f4e","account_number":"6300","account_name":"Travel & Entertainment - Generic","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712b1d0e372af','202405171217f5b6a217','{"id":"de7fdd41-79b6-4c02-8a4e-44b845f92f0a","account_number":"6400","account_name":"Marketing - Generic (Non People Cost)","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517124e1b62a1c4','202405171217f5b6a217','{"id":"f4e1e0f5-6e2d-4b8c-9ab8-df9a446fe1e5","account_number":"6600","account_name":"Technology Infrastructure OPEX","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712d9c3e2a5b7','202405171217f5b6a217','{"id":"c6c9f410-1d59-4147-b6ab-abc674a8c9e3","account_number":"6700","account_name":"Legal - Generic (Non People Cost)","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712a6b9d3f2c4','202405171217f5b6a217','{"id":"bd563da7-94b3-40d5-a3d0-11cb9984f6d1","account_number":"6800","account_name":"Occupancy Expense","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712f7c2b8a1e9','202405171217f5b6a217','{"id":"acf62c65-5469-4d5f-8d0f-146c44b2f6c2","account_number":"6870","account_name":"Bank fees & charges","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712c8d1a6b9e0','202405171217f5b6a217','{"id":"eb19e7a3-3c75-4694-89ab-14e4d6fa89c4","account_number":"6990","account_name":"Depreciation (OPEX)","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712e7b5a2c4d9','202405171217f5b6a217','{"id":"56b67c21-9e83-4b38-8e0b-f59a6c574c98","account_number":"6900","account_name":"Other G&A","control_group":"OPEX","type":"P&L"}');



INSERT INTO types (id, name, description, attributes) VALUES ('2024051712d9b2a1f7e6','7 - Non Op Income','None Operating Income from P&L','{"id":"b8d6f3c1-7883-4af1-b0a6-6c8c6584e08d","name":"Non Op Income","description":"Non Op Income Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Non Op Income","type":"object","properties":{"non_op_income":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the non-operating income entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["non_op_income"]}}');
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712a3f4c5b6d8','8 - Non Op Expense','None Operating Expense from P&L','{"id":"2e1f2f65-87b3-4a75-b6af-4680cbfb749e","name":"Non Op Expense","description":"Non Op Expense Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Non Op Expense","type":"object","properties":{"non_op_expense":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the non-operating expense entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["non_op_expense"]}}');


CREATE TABLE activities (
    id VARCHAR(20) PRIMARY KEY,
    operational_entity_id INT REFERENCES operational_entities(id),
    financial_entity_id INT REFERENCES financial_entities(id),
    attributes JSONB NOT NULL
);

CREATE TABLE scenarios (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changes JSONB NOT NULL
);

CREATE INDEX idx_operational_entities_id ON operational_entities(id);
CREATE INDEX idx_financial_entities_id ON financial_entities(id);
CREATE INDEX idx_types_type_name ON types(type_name);
CREATE INDEX idx_activities_id ON activities(id);
CREATE INDEX idx_activities_operational_entity_id ON activities(operational_entity_id);
CREATE INDEX idx_activities_financial_entity_id ON activities(financial_entity_id);
CREATE INDEX idx_scenarios_id ON scenarios(id);
CREATE INDEX idx_scenarios_changes ON scenarios USING gin (changes);


-- schema validation
CREATE OR REPLACE FUNCTION validate_scenario_changes()
RETURNS TRIGGER AS $$
DECLARE
    item JSONB;
BEGIN
    FOR item IN SELECT * FROM jsonb_array_elements(NEW.changes)
    LOOP
        -- Validate Operational Entity
        PERFORM 1 FROM operational_entities WHERE id = (item->>'operational_entity_id')::INT;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Operational entity ID % not found', item->>'operational_entity_id';
        END IF;

        -- Validate Financial Entity
        PERFORM 1 FROM financial_entities WHERE id = (item->>'financial_entity_id')::INT;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Financial entity ID % not found', item->>'financial_entity_id';
        END IF;

        -- Validate Type in Attributes
        IF item->'attributes' ? 'type' THEN
            PERFORM 1 FROM types WHERE type_name = item->'attributes'->>'type';
            IF NOT FOUND THEN
                RAISE EXCEPTION 'Type % not found in types table', item->'attributes'->>'type';
            END IF;
        END IF;

        -- Additional validation for specific scenarios
        IF (item->'attributes'->>'magnitude')::FLOAT > 10 THEN
            IF item->'attributes'->>'type' IS DISTINCT FROM 'special_type' THEN
                RAISE EXCEPTION 'For magnitudes > 10, type must be special_type';
            END IF;
        END IF;

        IF item->'attributes' ? 'additional_salary' THEN
            IF (item->'attributes'->>'additional_salary')::INT <= 0 THEN
                RAISE EXCEPTION 'Additional salary must be greater than 0';
            END IF;
        END IF;
    END LOOP;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- trigger for validation
CREATE TRIGGER validate_scenario_changes_trigger
BEFORE INSERT OR UPDATE ON scenarios
FOR EACH ROW
EXECUTE FUNCTION validate_scenario_changes();


-- materialized view for improve read performance
CREATE MATERIALIZED VIEW activity_summary AS
SELECT 
    a.id AS activity_id,
    oe.name AS operational_entity_name,
    fe.name AS financial_entity_name,
    a.attributes
FROM 
    activities a
JOIN 
    operational_entities oe ON a.operational_entity_id = oe.id
JOIN 
    financial_entities fe ON a.financial_entity_id = fe.id;

--  refreshing materialized view 
CREATE OR REPLACE FUNCTION refresh_activity_summary()
RETURNS VOID AS $$
BEGIN
    REFRESH MATERIALIZED VIEW activity_summary;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER refresh_activity_summary_trigger
AFTER INSERT OR UPDATE OR DELETE ON activities
FOR EACH STATEMENT
EXECUTE FUNCTION refresh_activity_summary();


-- Insert into operational_entities
INSERT INTO operational_entities (id,name, description, attributes) VALUES ('2024051712d2d2d2d2d2','Employee','Individuals working for the company','{"id":"f47ac10b-58cc-4372-a567-0e02b2c3d479","name":"Employee","description":"Individuals working for the company","relationships":[{"activity":[9]}]}');


-- Insert into financial_entities
INSERT INTO financial_entities (name, description) VALUES ('Salary', 'Financial entity representing salaries');
INSERT INTO financial_entities (name, description) VALUES ('Budget', 'Financial entity representing budget');
{"name":"Employee","description":"Individuals working for the company","type":2,"relationships":[{"department":[4]},{"activity":[9]}]}


-- Insert into activities
INSERT INTO activities (operational_entity_id, financial_entity_id, attributes) VALUES 
(1, 1, '{"id":"895dfdd2-b547-4f2c-bb7e-48f8e5a8f5ad","name":"Employee Activvity","description":"Impact of employees on financial","relationships":[{"cogs":[12],"opex":[13]}],"magnitude":1.0}'),
(1, 1, '{"magnitude": 10, "additional_salary": 60000, "type": "new_hires"}'),
(2, 2, '{"magnitude": 1, "new_location": "Los Angeles", "type": "office_opening"}');

-- Insert into scenarios
INSERT INTO scenarios (name, description, changes) VALUES 
('Increase Alice Salary', 'Increase Alice salary by 10%', '[{"operational_entity_id": 1, "financial_entity_id": 1, "attributes": {"magnitude": 1.1, "type": "salary_increase"}}]'),
('Scenario with Multiple Changes', 'Increase Alice salary by 10%, Add 10 New Sales Agents, Open new office in LA', '[
    {"operational_entity_id": 1, "financial_entity_id": 1, "attributes": {"magnitude": 1.1, "type": "salary_increase"}},
    {"operational_entity_id": 1, "financial_entity_id": 1, "attributes": {"magnitude": 10, "additional_salary": 60000, "type": "new_hires"}},
    {"operational_entity_id": 2, "financial_entity_id": 2, "attributes": {"magnitude": 1, "new_location": "Los Angeles", "type": "office_opening"}}
]');
