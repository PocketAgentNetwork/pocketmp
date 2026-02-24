#!/bin/bash

# PocketMP Skill Installer
# Installs skills to your PocketAgent workspace

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default installation path
DEFAULT_INSTALL_PATH="$HOME/.openclaw/workspace/skills"

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Functions
print_usage() {
    echo "Usage: $0 [OPTIONS] <skill-name>"
    echo ""
    echo "Options:"
    echo "  --list              List all available skills"
    echo "  --info <skill>      Show information about a skill"
    echo "  --path <path>       Custom installation path (default: $DEFAULT_INSTALL_PATH)"
    echo "  --remove <skill>    Remove an installed skill"
    echo "  --help              Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 web-search                    # Install web-search skill"
    echo "  $0 --path /custom/path web-search  # Install to custom location"
    echo "  $0 --list                        # List all skills"
    echo "  $0 --info web-search             # Show skill info"
    echo "  $0 --remove web-search           # Remove installed skill"
}

list_skills() {
    echo -e "${BLUE}📦 Available Skills:${NC}\n"
    
    echo -e "${GREEN}Official Skills:${NC}"
    if [ -d "$REPO_ROOT/official" ]; then
        for skill in "$REPO_ROOT/official"/*; do
            if [ -d "$skill" ]; then
                skill_name=$(basename "$skill")
                if [ -f "$skill/SKILL.md" ]; then
                    # Extract description from frontmatter
                    desc=$(sed -n '/^---$/,/^---$/p' "$skill/SKILL.md" | grep "^description:" | sed 's/description: //' | tr -d '"' | head -1)
                    if [ -n "$desc" ]; then
                        echo "  • $skill_name - $desc"
                    else
                        echo "  • $skill_name"
                    fi
                else
                    echo "  • $skill_name"
                fi
            fi
        done
    fi
    
    echo ""
    echo -e "${YELLOW}Community Skills:${NC}"
    if [ -d "$REPO_ROOT/community" ] && [ "$(ls -A "$REPO_ROOT/community" 2>/dev/null)" ]; then
        for skill in "$REPO_ROOT/community"/*; do
            if [ -d "$skill" ]; then
                skill_name=$(basename "$skill")
                if [ -f "$skill/SKILL.md" ]; then
                    desc=$(sed -n '/^---$/,/^---$/p' "$skill/SKILL.md" | grep "^description:" | sed 's/description: //' | tr -d '"' | head -1)
                    if [ -n "$desc" ]; then
                        echo "  • $skill_name - $desc"
                    else
                        echo "  • $skill_name"
                    fi
                else
                    echo "  • $skill_name"
                fi
            fi
        done
    else
        echo "  (No community skills yet - be the first to contribute!)"
    fi
}

show_info() {
    local skill_name=$1
    local skill_path=""
    
    # Check official first
    if [ -d "$REPO_ROOT/official/$skill_name" ]; then
        skill_path="$REPO_ROOT/official/$skill_name"
        echo -e "${GREEN}Official Skill${NC}"
    elif [ -d "$REPO_ROOT/community/$skill_name" ]; then
        skill_path="$REPO_ROOT/community/$skill_name"
        echo -e "${YELLOW}Community Skill${NC}"
    else
        echo -e "${RED}Error: Skill '$skill_name' not found${NC}"
        exit 1
    fi
    
    echo ""
    
    if [ -f "$skill_path/SKILL.md" ]; then
        # Extract only the first frontmatter block
        echo -e "${BLUE}Skill Information:${NC}"
        awk '/^---$/{if(++count==2) exit} count==1 && /^(name|description|author|version|tags):/{print "  " $0}' "$skill_path/SKILL.md"
        
        echo ""
        echo -e "${BLUE}Files:${NC}"
        ls -1 "$skill_path" | sed 's/^/  • /'
    else
        echo -e "${RED}Error: SKILL.md not found${NC}"
        exit 1
    fi
}

install_skill() {
    local skill_name=$1
    local install_path=$2
    local skill_source=""
    local skill_type=""
    
    # Find the skill
    if [ -d "$REPO_ROOT/official/$skill_name" ]; then
        skill_source="$REPO_ROOT/official/$skill_name"
        skill_type="official"
    elif [ -d "$REPO_ROOT/community/$skill_name" ]; then
        skill_source="$REPO_ROOT/community/$skill_name"
        skill_type="community"
    else
        echo -e "${RED}Error: Skill '$skill_name' not found${NC}"
        echo ""
        echo "Available skills:"
        list_skills
        exit 1
    fi
    
    # Validate skill has SKILL.md
    if [ ! -f "$skill_source/SKILL.md" ]; then
        echo -e "${RED}Error: Invalid skill - SKILL.md not found${NC}"
        exit 1
    fi
    
    # Create installation directory if it doesn't exist
    mkdir -p "$install_path"
    
    # Check if skill already exists
    if [ -d "$install_path/$skill_name" ]; then
        echo -e "${YELLOW}Warning: Skill '$skill_name' already exists at $install_path${NC}"
        read -p "Overwrite? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Installation cancelled."
            exit 0
        fi
        rm -rf "$install_path/$skill_name"
    fi
    
    # Copy skill
    echo -e "${BLUE}Installing $skill_type skill: $skill_name${NC}"
    cp -r "$skill_source" "$install_path/$skill_name"
    
    # Success message
    echo -e "${GREEN}✓ Successfully installed '$skill_name' to $install_path/$skill_name${NC}"
    
    if [ "$skill_type" = "community" ]; then
        echo -e "${YELLOW}Note: This is a community skill. Use at your own discretion.${NC}"
    fi
    
    echo ""
    echo "To use this skill, restart your agent or reload skills."
}

remove_skill() {
    local skill_name=$1
    local install_path=${2:-$DEFAULT_INSTALL_PATH}
    
    # Check if skill exists
    if [ ! -d "$install_path/$skill_name" ]; then
        echo -e "${RED}Error: Skill '$skill_name' not found at $install_path${NC}"
        echo ""
        echo "Installed skills:"
        if [ -d "$install_path" ]; then
            ls -1 "$install_path" 2>/dev/null | sed 's/^/  • /' || echo "  (No skills installed)"
        else
            echo "  (Skills directory does not exist)"
        fi
        exit 1
    fi
    
    # Confirm removal
    echo -e "${YELLOW}Warning: This will permanently remove '$skill_name'${NC}"
    echo "Location: $install_path/$skill_name"
    read -p "Are you sure? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Removal cancelled."
        exit 0
    fi
    
    # Remove skill
    rm -rf "$install_path/$skill_name"
    
    echo -e "${GREEN}✓ Successfully removed '$skill_name'${NC}"
    echo ""
    echo "Restart your agent to complete the removal."
}

# Main script
main() {
    local install_path="$DEFAULT_INSTALL_PATH"
    local skill_name=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --list)
                list_skills
                exit 0
                ;;
            --info)
                if [ -z "$2" ]; then
                    echo -e "${RED}Error: --info requires a skill name${NC}"
                    exit 1
                fi
                show_info "$2"
                exit 0
                ;;
            --remove)
                if [ -z "$2" ]; then
                    echo -e "${RED}Error: --remove requires a skill name${NC}"
                    exit 1
                fi
                skill_name="$2"
                shift 2
                # Continue parsing for --path option
                while [[ $# -gt 0 ]]; do
                    case $1 in
                        --path)
                            if [ -z "$2" ]; then
                                echo -e "${RED}Error: --path requires a directory${NC}"
                                exit 1
                            fi
                            install_path="$2"
                            shift 2
                            ;;
                        *)
                            echo -e "${RED}Error: Unknown option $1${NC}"
                            exit 1
                            ;;
                    esac
                done
                remove_skill "$skill_name" "$install_path"
                exit 0
                ;;
            --path)
                if [ -z "$2" ]; then
                    echo -e "${RED}Error: --path requires a directory${NC}"
                    exit 1
                fi
                install_path="$2"
                shift 2
                ;;
            --help)
                print_usage
                exit 0
                ;;
            -*)
                echo -e "${RED}Error: Unknown option $1${NC}"
                print_usage
                exit 1
                ;;
            *)
                skill_name="$1"
                shift
                ;;
        esac
    done
    
    # Check if skill name provided
    if [ -z "$skill_name" ]; then
        echo -e "${RED}Error: No skill name provided${NC}"
        echo ""
        print_usage
        exit 1
    fi
    
    # Install the skill
    install_skill "$skill_name" "$install_path"
}

main "$@"
